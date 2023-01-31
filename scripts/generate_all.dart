// ignore_for_file: unused_import

import 'utils.dart';
import 'generate.dart' as generate;
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  final locales = await getAvaialableLocalesInProject();

  for (var locale in locales) {
    await generate.main([locale]);
  }
}
