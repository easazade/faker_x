// ignore_for_file: unused_import

import 'dart:io';

import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  final args = checkArgs(arguments);

  final locale = args[0].toLowerCase();

  checkLocale(locale);

  printRed('Removing all files and code available for locale [$locale]');

  var locales = await getAvaialableLocalesInProject();
  locales.remove(locale);
  locales = locales.toSet().toList();

  // generate lib/src/base/locale.dart file
  await generateLocaleFile(locales);

  // generate lib/src/base/faker_x_class.dart file
  await generateFakerXClassFile(locales);

  // remove generated files for given locale
  await _removeGeneratedFilesForLocale(locale);

  await createImports();
}

Future _removeGeneratedFilesForLocale(String locale) async {
  final dir = Directory('lib/src/locales/$locale');
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }
}
