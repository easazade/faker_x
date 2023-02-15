// ignore_for_file: unused_import

import 'dart:io';

import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  printBlue('Regeneating base classes');
  var locales = await getAvaialableLocalesInProject();

  // generate lib/src/base/locale.dart file
  await generateLocaleFile(locales);

  // generate lib/src/base/faker_x_class.dart file
  await generateFakerXClassFile(locales);

  await generateFakeCollectionFile();

  await createImports();
}
