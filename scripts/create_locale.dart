// ignore_for_file: unused_import

import 'dart:io';

import 'package:recase/recase.dart';

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

  await generate.main([locale, 'true']);
}

Future _createDataSources(String locale) async {
  final requriedDataSources = await getRequiredDataSources();

  for (var resource in requriedDataSources.keys) {
    final buffer =
        StringBuffer("import 'package:fake_it/src/base/base.dart';\n\n");
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
