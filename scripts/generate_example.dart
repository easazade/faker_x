// ignore_for_file: unused_import

import 'package:recase/recase.dart';

import 'lib_imports.dart';
import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';

Future main(List<String> args) async {
  printGreen('Generating code in example project');
  final buffer = StringBuffer(
      'import "package:faker_x/faker_x.dart";\n Future main(List<String> args) async {');

  final locales = await getAvaialableLocalesInProject();
  for (var locale in locales) {
    final dsInfosMap = await readAvailableDataSourcesForLocaleMapped(locale);
    for (var entry in dsInfosMap.entries) {
      final resourceName = entry.key;
      final dsInfoList = entry.value;
      buffer.writeln('\n// $locale - $resourceName');
      for (var dsInfo in dsInfoList) {
        if (dsInfo.builderArgTypeFields.isEmpty) {
          buffer.writeln(
              'print("${dsInfo.varName} = \${$fakerXClassName.localized.$locale.$resourceName.${dsInfo.varName.camelCase}}");');
        }
      }
    }
  }
  buffer.writeln('}');

  writeFile(content: buffer.toString(), path: 'example/bin/example.dart');
}
