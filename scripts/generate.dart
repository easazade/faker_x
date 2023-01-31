// ignore_for_file: unused_import, curly_braces_in_flow_control_structures

import 'dart:developer';
import 'dart:io';
import 'dart:mirrors';

import 'package:collection/collection.dart';
import 'package:fake_it/fake_it.dart';
import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'create_locale.dart';
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
  buffer.writeln('import \'package:fake_it/src/base/base.dart\';\n');

  for (var entry in dataSources.entries.map((e) => e)) {
    final uri = entry.value.first.fileUri;
    final ref = '${entry.key}1';
    buffer.writeln('import \'$uri\' as $ref;');
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
    buffer.writeln('${item.resourceName}1.${item.varName},');
  }
  buffer.writeln(']');

  buffer.writeln(',);\n'); // end of super

  if (!createEmptyClass)
    for (var entry in requiredDataSources.entries) {
      final resourceName = entry.key;
      final requiredList = entry.value;

      final availableListDetails = dataSources[resourceName];
      if (availableListDetails == null) {
        throw Exception(
          'Cannot find datasource file neither in lib/locales/$locale/datasources/$resourceName.dart nor in '
          'global datasources lib/locales/global/datasources/$resourceName.dart\n'
          'Please make sure the file exists and has variables of type DataSource for $resourceName in it.',
        );
      }

      for (var dsInfo in availableListDetails) {
        if (dsInfo.dataSource.formats.isEmpty &&
            dsInfo.dataSource.values.isEmpty) {
          throw Exception(
            'DataSource ${dsInfo.varName} defined in locales/$locale/datasources/${dsInfo.resourceName}.dart '
            'has neither any item in its values or formats. Please provide either values or formats or both',
          );
        }
      }

      final availableList =
          dataSources[resourceName]?.map((e) => e.varName).toList();

      if (availableList != null) {
        if (!availableList.containsAll(requiredList)) {
          throw Exception(
            'Provided datasources for $resourceName is missing required a required DataSource\n'
            'required list of DataSources for resource $resourceName is $requiredList But provided list of DataSources '
            'is $availableList please make sure you have provided all the required datasources with the correct '
            'variable name and key in locales/$locale/datasources/$resourceName.dart\n',
          );
        }

        if (availableList.length > requiredList.length) {
          final baseResClassName = ReCase(resourceName).pascalCase;
          final resClassName = ReCase(locale).pascalCase + baseResClassName;
          buffer.writeln('@override');
          buffer.writeln(
              '$resClassName get $resourceName => $resClassName(locale);\n');

          final classBuffer = StringBuffer();
          classBuffer
              .writeln('class $resClassName extends $baseResClassName {');
          classBuffer.writeln('final FakeItLocale locale;\n');
          classBuffer.writeln('$resClassName(this.locale) : super(locale);\n');

          for (var dataSourceName in availableList) {
            if (!requiredList.contains(dataSourceName))
              classBuffer.writeln(
                  'String get ${ReCase(dataSourceName).camelCase} => provide(DataKeys.$dataSourceName,locale);');
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
