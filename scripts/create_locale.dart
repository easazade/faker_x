// ignore_for_file: unused_import

import 'dart:io';

import 'package:recase/recase.dart';

import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

import 'generate.dart' as generate;

/// adds support for a new locale to faker_x.
///
/// eg: if given "locale" is "fa_ir". a new directory will be added to lib/src/locales/fa_ir with all the basic
/// file and codes that are required.
/// NOTE: all datasources created in lin/src/locales/fa_ir are empty and must be filled before running scripts/generate.dart
Future main(List<String> arguments) async {
  final args = checkArgs(arguments);

  final locale = args[0].toLowerCase();

  checkLocale(locale);

  printGreen('Creating new files for new locale [$locale]');

  var locales = await getAvailableLocalesInProject();
  locales.add(locale);
  locales = locales.toSet().toList();

  // generate lib/src/base/locale.dart file
  await generateLocaleFile(locales);

  // create datasources from templates/datasources for given locale and copy to lib/src/locales/$locale/datasources/
  printGreen('Creating required Datasource files in '
      'lib/src/locales/$locale/datasources to be filled');

  await _createRequiredDataSources(locale);

  await createScriptsImportsFile();

  // generate lib/src/base/faker_x_class.dart file
  await generateFakerXClassFile(locales);

  await generate.main([locale, 'true']);
}

Future _createRequiredDataSources(String locale) async {
  final requiredDataSources = await getUnavailableDataSourceNames();

  for (var resource in requiredDataSources.keys) {
    final buffer =
        StringBuffer("import 'package:faker_x/src/base/base.dart';\n\n");
    for (var datasourceName in requiredDataSources[resource]!) {
      buffer.writeln(
        await render(
          'templates/datasource.mustache',
          values: {'locale': locale, 'name': ReCase(datasourceName).snakeCase},
        ),
      );
    }
    final fileName = '$resource.dart';

    final filePath = 'lib/src/locales/$locale/datasources/$fileName';
    await writeFile(content: buffer.toString(), path: filePath);
  }
}
