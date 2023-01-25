// ignore_for_file: unused_import

import 'dart:io';
import 'dart:mirrors';
import 'package:fake_it/fake_it.dart';
import 'package:glob/glob.dart';
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

Future<Map<String, List<String>>> getRequiredDataSources() async {
  final dataSourceGlobe = Glob('package:fake_it/src/base/resources.dart');

  final libMirror = currentMirrorSystem()
      .libraries
      .values
      .where((mirror) => dataSourceGlobe.matches(mirror.uri.toString()))
      .toList()
      .first;

  Map<String, List<String>> requiredResources = {};

  for (var entry in libMirror.declarations.entries
      .where((element) => element.value is ClassMirror)) {
    final resourceSymbol = entry.key;
    final resourceName = MirrorSystem.getName(entry.key).toLowerCase();
    final mirrorOnResource = entry.value as ClassMirror;
    print('$resourceSymbol \n');

    for (var getter in mirrorOnResource.declarations.entries.where((element) =>
        element.value is MethodMirror &&
        !(element.value as MethodMirror).isConstructor)) {
      final getterSymbol = getter.key;

      final getterName = MirrorSystem.getName(getterSymbol);
      if (requiredResources[resourceName] == null) {
        requiredResources[resourceName] = [];
      }
      requiredResources[resourceName]!.add(getterName);
    }
  }

  print(requiredResources);
  return requiredResources;
}


// class DataSourceInfo {
//   DataSourceInfo({
//     required this.fileName,
//     required this.dataSources,
//   });

//   final String fileName;
//   final List<DataSource> dataSources;
// }
