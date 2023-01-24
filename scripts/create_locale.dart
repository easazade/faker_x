import 'dart:io';

import 'utils.dart';

final _testArgs = <String>[];
Future main(List<String> args) async {
  // _checkArgs(args);

  // final locale = args[0];

  final dir = Directory('lib/src/locales/');
  final List<FileSystemEntity> entities = await dir.list().toList();
  final locales = entities.map((e) => e.path.split('/').last).toList();

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

void _checkArgs(List<String> args) {
  if (args.isEmpty && _testArgs.isNotEmpty) {
    args.addAll(_testArgs);
  }

  if (args.isEmpty) {
    throw Exception('\n\nPlease pass locale as argument\nEG: en_us\n\n');
  }
}

Future writeFile({required String content, required String path}) async {
  final file = await File(path).create(recursive: true);
  await file.writeAsString(content);
}
