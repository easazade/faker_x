// ignore_for_file: unused_import

import 'dart:io';

import 'package:recase/recase.dart';

import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

import 'generate.dart' as generate;

Future main(List<String> arguments) async {
  final args = checkArgs(arguments);

  final locale = args[0].toLowerCase();

  checkLocale(locale);

  printGreen('Creating new files for new locale [$locale]');

  var locales = await getAvaialableLocalesInProject();
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
  final requriedDataSources = await getUnavailableDataSourceNames();

  for (var resource in requriedDataSources.keys) {
    final buffer =
        StringBuffer("import 'package:faker_x/src/base/base.dart';\n\n");
    for (var datasourceName in requriedDataSources[resource]!) {
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
