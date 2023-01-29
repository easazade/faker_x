// ignore_for_file: unused_import

import 'dart:io';

import 'names.dart';
import 'utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  var locales = await getAvaialableLocalesInProject();
  locales = locales.toSet().toList();

  // generate lib/src/base/locale.dart file
  await generateLocaleFile(locales);

  // generate lib/src/base/fake_it_class.dart file
  await generateFakeItClassFile(locales);

  await createImports();
}
