import 'dart:io';

import 'package:mustache_template/mustache_template.dart';

/// reads and renders mustache template from the given [filePath] with provided [values]
///
/// if [templateName] is provided it will be used in error messages
Future<String> render(
  final String filePath, {
  String? templateName,
  dynamic values,
}) async {
  final sampleFileContent = await File(filePath).readAsString();
  final template = Template(
    sampleFileContent,
    name: templateName ?? filePath,
    lenient: true,
  );

  final output = template.renderString(values);
  return output;
}

/// creates a file in the given [path] and writes given [content] to it.
Future writeFile({required String content, required String path}) async {
  final file = await File(path).create(recursive: true);
  await file.writeAsString(content);
}

/// checks given [locale] to see whether it is in correct format or not
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

/// reads the project and if there is a locale in our project that there is support for it will be returned
/// eg: if right now fake_it has multilingual support for 10 locales like en_us, fa_ir etc they will be returned
Future<List<String>> getAvaialableLocalesInProject() async {
  final dir = Directory('lib/src/locales/');
  final List<FileSystemEntity> entities = await dir.list().toList();
  return entities.map((e) => e.path.split('/').last).toList();
}
