// ignore_for_file: unused_import

import 'dart:io';

import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  var locales = await getAvaialableLocalesInProject();

  // generate lib/src/base/locale.dart file
  await generateLocaleFile(locales);

  // generate lib/src/base/fake_it_class.dart file
  await generateFakeItClassFile(locales);

  await createImports();
}
