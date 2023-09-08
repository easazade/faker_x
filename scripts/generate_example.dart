// ignore_for_file: unused_import

import 'package:recase/recase.dart';

import 'lib_imports.dart';
import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';

/// generates example code in example project.
Future main(List<String> args) async {
  printYellow('Generating example');
  final exampleFile = StringBuffer(
    'import "package:faker_x/faker_x.dart";\n'
    'Future main(List<String> args) async {',
  );

  final locales = await getAvailableLocalesInProject();
  for (var locale in locales) {
    final dataSourceInfosMap =
        await readAvailableDataSourcesForLocaleMapped(locale);
    for (var entry in dataSourceInfosMap.entries) {
      final resourceName = entry.key;
      final dataSourceInfoList = entry.value;
      exampleFile.writeln('\n// $locale - $resourceName');
      for (var info in dataSourceInfoList) {
        if (info.builderArgTypeFields.isEmpty) {
          exampleFile.writeln(
              'print("${info.varName} = \${$fakerXClassName.localized.$locale.$resourceName.${info.varName.camelCase}}");');
        }
      }
    }
  }

  exampleFile.writeln('}');

  writeFile(content: exampleFile.toString(), path: 'example/bin/example.dart');
}
