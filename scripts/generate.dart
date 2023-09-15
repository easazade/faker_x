// ignore_for_file: unused_import, curly_braces_in_flow_control_structures

import 'dart:developer';
import 'dart:io';
import 'dart:mirrors';

import 'package:collection/collection.dart';
import 'package:faker_x/faker_x.dart';
import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'create_locale.dart';
import 'utils/cli.dart';
import 'utils/ext.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

/// Regenerates code in written in lib/src/locales/ for the given locale
///
/// eg: for given locale "en_us" it will read all datasources from lib/src/locales/en_us/datasources
/// and generates lib/src/locales/en_us/en_us.dart file which contains [EnUsCollection] class with all its
/// localized resource classes if there is any, like [EnUsAddress] or [EnUsJob] and etc.
///
Future main(List<String> arguments) async {
  final args = checkArgs(arguments);

  final locale = args[0];

  final createEmpty = args.length > 1 ? args[1].parseBool() : false;

  checkLocale(locale);

  checkValidityOfDataKeys();

  await generateFakeCollectionFile();

  await createScriptsImportsFile();

  final localizedCollectionFilePath = 'lib/src/locales/$locale/$locale.dart';

  await _createFakeCollectionClass(
    dataSources: await readAvailableDataSourcesForLocaleMapped(locale),
    requiredDataSources: await readRequiredDataSources(),
    locale: locale,
    savePath: localizedCollectionFilePath,
    createEmptyClass: createEmpty,
  );
}

Future _createFakeCollectionClass({
  required Map<String, List<DataSourceInfo>> dataSources,
  required Map<String, List<String>> requiredDataSources,
  required String locale,
  required String savePath,
  required bool createEmptyClass,
}) async {
  printSeparator();
  printGreen('Generating ${createCollectionClassName(locale)} class');

  final buffer = StringBuffer();

  final localizedClasses = <String>[];

  // writing directives
  buffer.writeln(
    '// ignore_for_file: annotate_overrides, unused_import\n\n'
    'import \'package:faker_x/src/base/base.dart\';\n',
  );

  final processedFileUris = <String>[];
  for (var dsInfo in dataSources.values.flattened) {
    if (!processedFileUris.contains(dsInfo.fileUri)) {
      processedFileUris.add(dsInfo.fileUri);
      buffer.writeln(dsInfo.importCodePhrase);
    }
  }

  final className = createCollectionClassName(locale);

  buffer.writeln('class $className extends $fakeCollectionClassName {');

  buffer.writeln('$className()');
  buffer.writeln(':super(locale: Locales.$locale);\n');

  // adding custom getter methods for customized resource classes
  if (!createEmptyClass) {
    await _checkAvailableDataSourcesForCodeGeneration(
      dataSources: await readAvailableDataSourcesForLocaleMapped(locale),
      requiredDataSources: await readRequiredDataSources(),
      locale: locale,
    );

    for (var entry in dataSources.entries) {
      final resourceName = entry.key;
      final requiredDataSourceInfosOnResource =
          requiredDataSources[resourceName] ?? [];

      final availableDataSourceInfosOnResource = entry.value;

      final availableDatasourceNamesOnResource =
          entry.value.map((e) => e.varName).toList();

      final containsDataSourceWithBuilderMethod =
          entry.value.any((dsInfo) => dsInfo.dataSource.builder != null);

      if (availableDatasourceNamesOnResource.length >
              requiredDataSourceInfosOnResource.length ||
          containsDataSourceWithBuilderMethod) {
        final baseResClassName = ReCase(resourceName).pascalCase;
        final resClassName = ReCase(locale).pascalCase + baseResClassName;

        buffer.writeln(
          '$resClassName get $resourceName => $resClassName(locale);\n',
        );

        final resourceClassCode = _createCustomResourceClass(
          resClassName: resClassName,
          baseResClassName: baseResClassName,
          availableDataSourceInfosOnResource:
              availableDataSourceInfosOnResource,
          requiredList: requiredDataSourceInfosOnResource,
        );

        localizedClasses.add(resourceClassCode);
      }
    }
  }

  buffer.writeln('}'); // end of class

  for (var cls in localizedClasses) {
    buffer.writeln(cls);
  }

  await writeFile(
    content: buffer.toString(),
    path: savePath,
    header: doNotModifyByHandHeader,
  );

  printGreen('Writing generated code into files');
}

String _createCustomResourceClass({
  required String resClassName,
  required String baseResClassName,
  required List<DataSourceInfo> availableDataSourceInfosOnResource,
  required List<String> requiredList,
}) {
  final classBuffer = StringBuffer();
  classBuffer.writeln('class $resClassName extends $baseResClassName {');
  classBuffer.writeln('final $fakerXLocaleClassName locale;\n');
  classBuffer.writeln('$resClassName(this.locale) : super(locale);\n');

  for (var dsInfo in availableDataSourceInfosOnResource) {
    if (!requiredList.contains(dsInfo.varName) ||
        dsInfo.dataSource.builder != null) {
      if (dsInfo.dataSource.builder == null ||
          dsInfo.builderArgsType == 'dynamic') {
        classBuffer.writeln(
            '${dsInfo.generatedValueType} get ${ReCase(dsInfo.varName).camelCase} => provide($dataKeysClassName.${dsInfo.varName},locale);\n');
      } else {
        final argsBuffer = StringBuffer('{');

        for (var arg in dsInfo.builderArgTypeFields) {
          if (arg.isRequired && arg.defaultValue == null)
            argsBuffer.write(' required ');
          argsBuffer.write(' ${arg.type}');
          argsBuffer.write(
            (arg.isRequired || arg.defaultValue != null) ? ' ' : '? ',
          );

          argsBuffer.write(arg.name);
          argsBuffer.write(
              (arg.defaultValue != null) ? '= ${arg.defaultValue},' : ', ');
        }

        final argObject =
            StringBuffer('${dsInfo.directiveRef}.${dsInfo.builderArgsType}(');
        for (var arg in dsInfo.builderArgTypeFields) {
          argObject.write('${arg.name}:${arg.name}, ');
        }
        argObject.write('),');

        argsBuffer.write('}');
        classBuffer.writeln(
            '${dsInfo.generatedValueType} ${ReCase(dsInfo.varName).camelCase}(${argsBuffer.toString()}) => provide($dataKeysClassName.${dsInfo.varName}, locale, args: $argObject );\n');
      }
    }
  }

  classBuffer.writeln('}\n');

  return classBuffer.toString();
}

Future _checkAvailableDataSourcesForCodeGeneration({
  required Map<String, List<DataSourceInfo>> dataSources,
  required Map<String, List<String>> requiredDataSources,
  required String locale,
}) async {
  printGreen('Reading codes to make sure it is ready to be generated from');

  // checking provided data before generating code
  for (var entry in requiredDataSources.entries) {
    final resourceName = entry.key;
    final requiredList = entry.value;
    final availableDsInfosOnResource = dataSources[resourceName];

    if (availableDsInfosOnResource == null) {
      exitWithMsg(
        error:
            'Cannot find datasource file neither in lib/locales/$locale/datasources/$resourceName.dart nor in '
            'global datasources lib/locales/global/datasources/$resourceName.dart\n'
            'Please make sure the file exists and has variables of type $dataSourceClassName for required by resource "$resourceName" in it.',
      );
    }

    for (var dsInfo in availableDsInfosOnResource!) {
      final msg =
          '$dataSourceClassName ${dsInfo.varName} defined in locales/$locale/datasources/${dsInfo.resourceName}.dart '
          'has not any item neither in its values nor formats. Please provide either values or formats or both '
          'or alternatively provide a builder property to be used instead of values and formats properties to generate '
          'fake values';

      if (dsInfo.dataSource is StringDataSource &&
          ((dsInfo.dataSource as StringDataSource).formats.isEmpty &&
              dsInfo.dataSource.values.isEmpty) &&
          dsInfo.dataSource.builder == null) {
        exitWithMsg(
          error: msg,
        );
      } else if (dsInfo.dataSource is TypeDataSource &&
          dsInfo.dataSource.values.isEmpty &&
          dsInfo.dataSource.builder == null) {
        exitWithMsg(error: msg);
      }
    }

    final availableDsNamesOnResource =
        dataSources[resourceName]?.map((e) => e.varName).toList();

    if (availableDsNamesOnResource?.containsAll(requiredList) == false) {
      exitWithMsg(
        error:
            'Provided datasources for $resourceName is missing required a required $dataSourceClassName\n'
            'required list of ${dataSourceClassName}s for resource $resourceName is $requiredList But provided list of ${dataSourceClassName}s '
            'is $availableDsNamesOnResource please make sure you have provided all the required datasources with the correct '
            'variable name and key in locales/$locale/datasources/$resourceName.dart',
      );
    }

    for (var dsInfo in dataSources.values.flattened) {
      if (!dsInfo.builderArgsType.endsWith('Args') &&
          !dsInfo.builderArgsType.endsWith('Arguments') &&
          dsInfo.builderArgsType != 'dynamic') {
        exitWithMsg(
          error:
              'Argument type defined for a datasource should have its name ended with Args or Arguments but '
              '${dsInfo.builderArgsType} in file ${dsInfo.fileUri} does not.',
        );
      }
    }

    for (var dsName in requiredList) {
      final dsInfo = availableDsInfosOnResource
          .firstWhereOrNull((dsInfo) => dsInfo.varName == dsName);

      if (dsInfo != null) {
        if (dsInfo.dataSource.builder != null &&
            dsInfo.builderArgsType != 'dynamic') {
          exitWithMsg(
            error: '''
You cannot define a $dataSourceClassName with ARG type ${dsInfo.builderArgsType} using withBuilder constructor for datasource "${dsInfo.varName}" 
because datasource "${dsInfo.varName}" of resource class "${dsInfo.resourceName.pascalCase}" is a required datasource. 
NOTE THAT: all the ${dataSourceClassName}s defined in Resource classes in "$resourcesAddress" are required datasources.

You have 2 options to define your datasources :

If you want to use a $dataSourceClassName.withBuilder constructor to generate fake value but you do not need an argument passed in the builder function
you can do so by defining your $dataSourceClassName with dynamic generic argument type like below:

final $dsName = $stringDataSourceClassName<dynamic>.withBuilder(
  dataKey: $dataKeysClassName.$dsName,
  locale: Locales.${dsInfo.dataSource.locale},
  builder: (_, $fakerXLocaleClassName locale) {
    // generate your value and return
    return '';
  },
);

OR define your $dataSourceClassName without using builder method:

const $dsName = $stringDataSourceClassName(
  dataKey: $dataKeysClassName.$dsName,
  locale: ${dsInfo.dataSource.locale},
  formats:[],
  values: [],
);



                 ''',
          );
        }
      }
    }
  }
}
