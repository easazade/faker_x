// ignore_for_file: unused_import

import 'utils/cli.dart';
import 'utils/utils.dart';
import 'generate.dart' as generate;
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  final locales = await getAvaialableLocalesInProject();

  printBlue('Generating FakeCollection classes for all locales');
  for (var locale in locales) {
    await generate.main([locale]);
  }
  printSeparator();
}
