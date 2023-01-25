import 'dart:io';

import 'package:recase/recase.dart';

import 'constants.dart';
import 'utils.dart';

final _testArgs = <String>['xx_xx'];
Future main(List<String> arguments) async {
  final args = _checkArgs(arguments);

  final locale = args[0].toLowerCase();

  checkLocale(locale);

  final dir = Directory('lib/src/locales/');
  final List<FileSystemEntity> entities = await dir.list().toList();
  List<String> locales = entities.map((e) => e.path.split('/').last).toList()
    ..add(locale);

  locales = locales.toSet().toList();

  // generate lib/src/base/locale.dart file
  await _generateLocaleFile(locales);

  // generate lib/src/base/fake_it_class.dart file
  await _generateFakeItClassFile(locales);

  // final address =
  //     await render('templates/datasources/address.mustache', values: {
  //   'locale': 'Locales.$locale',
  // });

  // print(address);
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

String createCollectionClassName(String locale) =>
    '${ReCase(locale).pascalCase}Collection';

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

void checkLocale(String locale) {
  final e = Exception(
    'provided locale is not valid please pass a correct locale argument. for example: en_us or en',
  );

  if (locale.length != 2 && locale.length != 5) {
    throw e;
  }

  if (locale.length == 5) {
    if (locale[2] != '_') {
      throw e;
    }
  }
}

List<String> _checkArgs(List<String> args) {
  if (args.isEmpty && _testArgs.isNotEmpty) {
    return _testArgs;
  }

  if (args.isEmpty) {
    throw Exception('\n\nPlease pass locale as argument\nEG: en_us\n\n');
  } else {
    return args;
  }
}

Future writeFile({required String content, required String path}) async {
  final file = await File(path).create(recursive: true);
  await file.writeAsString(content);
}
