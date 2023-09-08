// ignore_for_file: unused_import

import 'package:collection/collection.dart';
import 'package:faker_x/faker_x.dart';

import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'generate.dart' as generate;
import 'lib_imports.dart';

/// adds all datasources for all locales in lib/src/base/registered_data_sources.dart
/// so that they will be available at runtime.
/// NOTE: supported locales can be found in lib/src/locales/
Future main(List<String> arguments) async {
  final locales = await getAvailableLocalesInProject();

  final buffer = StringBuffer('''
import 'package:faker_x/src/base/data_source.dart';
import 'package:faker_x/src/base/keys.dart';
import 'package:faker_x/src/base/locale.dart';
''');

  printBlue(
      'adding all datasources for all locales in lib/src/base/registered_data_sources.dart');

  final Map<String, Map<String, List<DataSourceInfo>>> mappedDataSourceInfos =
      {};

  for (var locale in locales) {
    mappedDataSourceInfos[locale] =
        await readAvailableDataSourcesForLocaleMapped(locale);
  }

  final processedFileUris = <String>[];
  final allDsInfos =
      mappedDataSourceInfos.values.map((e) => e.values).flattened.flattened;

  for (var dsInfo in allDsInfos) {
    if (!processedFileUris.contains(dsInfo.fileUri)) {
      processedFileUris.add(dsInfo.fileUri);
      buffer.writeln(dsInfo.importCodePhrase);
    }
  }

  buffer.writeln(
      'final Map<FakerXLocale, Map<String, DataSource>> registeredDataSources = {');

  for (var entry in mappedDataSourceInfos.entries) {
    final locale = entry.key;
    final dsInfosMapped = entry.value;
    buffer.writeln('Locales.$locale: {');
    for (var dsInfoEntry in dsInfosMapped.entries) {
      final resourceName = dsInfoEntry.key;
      final dsInfos = dsInfoEntry.value;
      buffer.writeln(
          '    // $locale.$resourceName has ${dsInfoEntry.value.length} DataSources');
      for (var dsInfo in dsInfos) {
        buffer.writeln(
            'DataKeys.${dsInfo.dataSource.dataKey.toString()} : ${dsInfo.directiveRef}.${dsInfo.varName},');
      }
    }
    buffer.writeln('},');
  }

  buffer.writeln('};');

  await writeFile(
    content: buffer.toString(),
    path: 'lib/src/base/registered_data_sources.dart',
    header: doNotModifyByHandHeader,
  );

  printSeparator();
}
