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

void checkDataKeyValidity(dataKey) {
  if (dataKey is! String) {
    throw Exception('retreived dataKey is not of type String');
  }
  if (dataKey.isBlank) throw Exception('data key cannot be an empty String');
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
    final resourceName = MirrorSystem.getName(entry.key).toLowerCase();
    final mirrorOnResource = entry.value as ClassMirror;

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

  return requiredResources;
}

Future<Map<String, List<DataSourceInfo>>>
    readAvailableDataSourcesForLocaleMapped(
  String locale,
) async {
  final list = await readAvailableDataSourcesForLocale(locale);
  Map<String, List<DataSourceInfo>> map = {};
  for (var item in list) {
    if (map[item.resourceName] == null) {
      map[item.resourceName] = [];
    }
    map[item.resourceName]!.add(item);
  }
  return map;
}

Future<List<DataSourceInfo>> readAvailableDataSourcesForLocale(
  String locale,
) async {
  final dataSourceGlobe =
      Glob('package:fake_it/src/locales/$locale/datasources/*.dart');

  final mirrors = currentMirrorSystem()
      .libraries
      .values
      .where((mirror) => dataSourceGlobe.matches(mirror.uri.toString()))
      .toList();

  final definedDataSources = <String>[];
  final dataSourceFilesUri = <String>[];

  final dataSourceInfoList = <DataSourceInfo>[];

  for (var mirror in mirrors) {
    dataSourceFilesUri.add(mirror.uri.toString());

    for (var varMirrorOnDataSource in mirror.declarations.values
        .whereType<VariableMirror>()
        .where((element) => element.isTopLevel)) {
      final instanceMirror = mirror.getField(varMirrorOnDataSource.simpleName);

      if (instanceMirror.reflectee is DataSource) {
        final dataSource = instanceMirror.reflectee as DataSource;
        checkDataKeyValidity(dataSource.dataKey);

        final varName = MirrorSystem.getName(varMirrorOnDataSource.simpleName);
        definedDataSources.add(varName);

        dataSourceInfoList.add(
          DataSourceInfo(
            fileUri: mirror.uri.toString(),
            varName: varName,
            dataSource: dataSource,
          ),
        );
      }
    }
  }

  print(definedDataSources);
  print(dataSourceFilesUri);
  print(dataSourceInfoList);

  return dataSourceInfoList;
}

void checkValidityOfDataKeys() {
  final dataSourceGlobe = Glob('package:fake_it/src/base/keys.dart');

  final libMirror = currentMirrorSystem()
      .libraries
      .values
      .where((mirror) => dataSourceGlobe.matches(mirror.uri.toString()))
      .toList()
      .first;

  final classMirrorOnDataKey =
      libMirror.declarations.values.whereType<ClassMirror>().first;

  for (var varMirror in classMirrorOnDataKey.declarations.values
      .whereType<VariableMirror>()
      .where((e) => e.isStatic && e.isConst)) {
    final varName = MirrorSystem.getName(varMirror.simpleName);
    final value =
        classMirrorOnDataKey.getField(varMirror.simpleName).reflectee as String;
    if (varName != value) {
      throw Exception(
        'Found a data key in ${libMirror.uri} with unequal value and variable name\n'
        'eg: $varName != $value\n'
        'Please Fix that first, then run the command again',
      );
    }
  }
}

class DataSourceInfo {
  DataSourceInfo({
    required this.fileUri,
    required this.varName,
    required this.dataSource,
  }) {
    if (varName != dataSource.dataKey) {
      throw Exception(
        'when defining DataSource variables, name of the variable should be the same as its dataKey value '
        'But ${dataSource.dataKey} != $varName',
      );
    }
  }

  final String fileUri;
  final String varName;
  final DataSource dataSource;

  String get fileName => fileUri.split('/').last;

  String get resourceName => fileName.split('.').first;

  @override
  String toString() {
    return 'DataSourceInfo( fileUri = $fileUri | varName = $varName | dataSource = \n$dataSource\n';
  }
}
