// ignore_for_file: unused_import

import 'package:recase/recase.dart';

import 'lib_imports.dart';
import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';

Future main(List<String> args) async {
  final buffer = StringBuffer(
      'import "package:fake_it/fake_it.dart";\n Future main(List<String> args) async {');

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
              'print("${dsInfo.varName} = \${$fakeItClassName.localized.$locale.$resourceName.${dsInfo.varName.camelCase}}");');
        }
      }
    }
  }
  buffer.writeln('}');

  writeFile(content: buffer.toString(), path: 'example/bin/example.dart');
}
