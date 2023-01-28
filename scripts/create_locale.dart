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
  await _generateLocaleFile(locales);

  // generate lib/src/base/fake_it_class.dart file
  await _generateFakeItClassFile(locales);

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

Future _generateFakeItClassFile(List<String> locales) async {
  final buffer = StringBuffer();

  for (var locale in locales) {
    buffer.writeln(
        'import \'package:fake_it/src/locales/$locale/$locale.dart\';');
  }

  // write class FakeIt
  buffer.writeln('class $fakeItClassName {');
  buffer.writeln('$fakeItClassName._();\n');

  buffer.writeln('static late final defaultInstance = EnUsCollection();');
  buffer.writeln('static late final localized = _Localized();');

  buffer.writeln('}');

  // write _Localized class
  buffer.writeln('class _Localized {');
  for (var locale in locales) {
    buffer.writeln(
      'late final $locale = ${createCollectionClassName(locale)}();',
    );
  }

  buffer.writeln('}');

  await writeFile(
      path: 'lib/src/base/fake_it_class.dart', content: buffer.toString());
}

Future _generateLocaleFile(List<String> locales) async {
  final localesContent = await render('templates/locale.mustache', values: {
    'locales': locales.map(
      (locale) {
        final parts = locale.split('_');
        return "static const $locale = FakeItLocale('${parts[0]}', '${(parts.length > 1 ? parts[1] : '')}');";
      },
    ),
  });

  await writeFile(path: 'lib/src/base/locale.dart', content: localesContent);
}

