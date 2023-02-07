// ignore_for_file: unused_import, curly_braces_in_flow_control_structures

import 'dart:developer';
import 'dart:io';
import 'dart:mirrors';

import 'package:collection/collection.dart';
import 'package:fake_it/fake_it.dart';
import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'create_locale.dart';
import 'utils/cli.dart';
import 'utils/ext.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  final args = checkArgs(arguments);

  final locale = args[0];

  final createEmpty = args.length > 1 ? args[1].parseBool() : false;

  checkLocale(locale);

  checkValidityOfDataKeys();

  await createImports();

  final localizedCollectionFilePath = 'lib/src/locales/$locale/$locale.dart';

  await _createFakeCollectionClass(
    dataSources: await readAvailableDataSourcesForLocaleMapped(locale),
    requiredDataSources: await getRequiredDataSources(),
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
  final buffer = StringBuffer();

  final localizedClasses = <String>[];

  // writing directives
  buffer.writeln(
    '// ignore_for_file: annotate_overrides\n\n'
    'import \'package:fake_it/src/base/base.dart\';\n',
  );

  final processedFileUris = <String>[];
  for (var dsInfo in dataSources.values.flattened) {
    if (!processedFileUris.contains(dsInfo.fileUri)) {
      processedFileUris.add(dsInfo.fileUri);
      buffer.writeln(dsInfo.importCodePhrase);
    }
  }

  final className = createCollectionClassName(locale);

  buffer.writeln('class $className extends FakeCollection {');
  buffer.writeln('final FakeItLocale locale;\n');

  buffer.writeln('$className()');
  buffer.writeln(': locale = Locales.$locale,');
  buffer.writeln('super(');

  buffer.writeln('locale: Locales.$locale,');

  buffer.writeln('dataSources: [');
  for (var item in dataSources.values.reduceToList) {
    buffer.writeln('${item.directiveRef}.${item.varName},');
  }
  buffer.writeln(']');

  buffer.writeln(',);\n'); // end of super

  if (!createEmptyClass) {
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
              'Please make sure the file exists and has variables of type DataSource for required by resource "$resourceName" in it.',
        );
      }

      for (var dsInfo in availableDsInfosOnResource!) {
        if ((dsInfo.dataSource.formats.isEmpty &&
                dsInfo.dataSource.values.isEmpty) &&
            dsInfo.dataSource.builder == null) {
          exitWithMsg(
            error:
                'DataSource ${dsInfo.varName} defined in locales/$locale/datasources/${dsInfo.resourceName}.dart '
                'has not any item neither in its values nor formats. Please provide either values or formats or both '
                'or alternatively provide a builder property to be used instead of values and formats properties to generate '
                'fake values',
          );
        }
      }

      final availableDsNamesOnResource =
          dataSources[resourceName]?.map((e) => e.varName).toList();

      if (availableDsNamesOnResource?.containsAll(requiredList) == false) {
        exitWithMsg(
          error:
              'Provided datasources for $resourceName is missing required a required DataSource\n'
              'required list of DataSources for resource $resourceName is $requiredList But provided list of DataSources '
              'is $availableDsNamesOnResource please make sure you have provided all the required datasources with the correct '
              'variable name and key in locales/$locale/datasources/$resourceName.dart',
        );
      }
    }

    // generating custom localized FakeCollection class file with its custom resource classes
    for (var entry in dataSources.entries) {
      final resourceName = entry.key;
      final requiredList = requiredDataSources[resourceName] ?? [];

      final availableDsInfosOnResource = entry.value;

      final availableDsNamesOnResource =
          entry.value.map((e) => e.varName).toList();

      final contatinsDataSourceWithBuilderMethod =
          entry.value.any((dsInfo) => dsInfo.dataSource.builder != null);
      if (availableDsNamesOnResource.length > requiredList.length ||
          contatinsDataSourceWithBuilderMethod) {
        final baseResClassName = ReCase(resourceName).pascalCase;
        final resClassName = ReCase(locale).pascalCase + baseResClassName;

        buffer.writeln(
          '$resClassName get $resourceName => $resClassName(locale);\n',
        );

        final classBuffer = StringBuffer();
        classBuffer.writeln('class $resClassName extends $baseResClassName {');
        classBuffer.writeln('final FakeItLocale locale;\n');
        classBuffer.writeln('$resClassName(this.locale) : super(locale);\n');

        for (var dsInfo in availableDsInfosOnResource) {
          printYellow(dsInfo.varName);
          if (!requiredList.contains(dsInfo.varName) ||
              dsInfo.dataSource.builder != null) {
            if (dsInfo.dataSource.builder == null ||
                dsInfo.builderArgsType == 'dynamic') {
              classBuffer.writeln(
                  'String get ${ReCase(dsInfo.varName).camelCase} => provide(DataKeys.${dsInfo.varName},locale);');
            } else {
              classBuffer.writeln(
                  'String ${ReCase(dsInfo.varName).camelCase}(${dsInfo.directiveRef}.${dsInfo.builderArgsType} args) => provide(DataKeys.${dsInfo.varName}, locale, args: args);');
            }
          }
        }

        classBuffer.writeln('}\n');

        localizedClasses.add(classBuffer.toString());
      }
    }
  }
  buffer.writeln('}'); // end of class

  for (var cls in localizedClasses) {
    buffer.writeln(cls);
  }

  await writeFile(content: buffer.toString(), path: savePath);
}
