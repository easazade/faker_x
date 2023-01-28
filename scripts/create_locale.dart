// ignore_for_file: unused_import

import 'dart:io';

import 'names.dart';
import 'utils.dart';
import 'lib_imports.dart';

import 'generate.dart' as generate;

Future main(List<String> arguments) async {
  final args = checkArgs(arguments);

  final locale = args[0].toLowerCase();

  checkLocale(locale);

  var locales = await getAvaialableLocalesInProject();
  locales.add(locale);
  locales = locales.toSet().toList();

  // generate lib/src/base/locale.dart file
  await generateLocaleFile(locales);

  // generate lib/src/base/fake_it_class.dart file
  await generateFakeItClassFile(locales);

  // create datasources from templates/datasources for given locale and copy to lib/src/locales/$locale/datasources/
  await _createDataSources(locale);

  await generate.main([locale]);
}

Future _createDataSources(String locale) async {
  final templates =
      Directory('templates/datasources').listSync().map((e) => e.path);

  for (var templatePath in templates) {
    final content = await render(
      templatePath,
      values: {'locale': 'Locales.$locale'},
    );

    final fileName =
        templatePath.split('/').last.replaceAll('.mustache', '.dart');

    final filePath = 'lib/src/locales/$locale/datasources/$fileName';
    await writeFile(content: content, path: filePath);
  }
}
