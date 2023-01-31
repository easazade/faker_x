// ignore_for_file: unused_import

import 'dart:io';
import 'dart:mirrors';
import 'package:fake_it/fake_it.dart';
import 'package:glob/glob.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:recase/recase.dart';
import '../lib_imports.dart';
import 'names.dart';

/// only use for debug & testing purposes
const _testArgs = <String>[
  'xx_xx',
];

List<String> checkArgs(List<String> args) {
  if (args.isEmpty && _testArgs.isNotEmpty) {
    return _testArgs;
  }

  if (args.isEmpty) {
    throw Exception('\n\nPlease pass locale as argument\nEG: en_us\n\n');
  } else {
    return args;
  }
}

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
    htmlEscapeValues: false,
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
  return entities.map((e) => e.path.split('/').last).toList()..remove('global');
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
      requiredResources[resourceName]!.add(ReCase(getterName).snakeCase);
    }
  }

  return requiredResources;
}

Future<Map<String, List<DataSourceInfo>>>
    readAvailableDataSourcesForLocaleMapped(
  String locale, {
  bool includeGlobals = true,
}) async {
  final list = await readAvailableDataSourcesForLocale(locale);
  Map<String, List<DataSourceInfo>> map = {};
  for (var item in list) {
    if (map[item.resourceName] == null) {
      map[item.resourceName] = [];
    }
    map[item.resourceName]!.add(item);
  }

  // reading global datasouces and adding them if there is no localized datasource for that resource
  final globalDataSources = await readGlobalDataSourcesMapped();

  for (var resource in globalDataSources.keys) {
    if (map[resource] == null) {
      map[resource] = globalDataSources[resource]!
          .map((e) => e.changeLocale(locale))
          .toList();
    }
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

  final dataSourceInfoList = <DataSourceInfo>[];

  for (var mirror in mirrors) {
    for (var varMirrorOnDataSource in mirror.declarations.values
        .whereType<VariableMirror>()
        .where((element) => element.isTopLevel)) {
      final instanceMirror = mirror.getField(varMirrorOnDataSource.simpleName);

      if (instanceMirror.reflectee is DataSource) {
        final dataSource = instanceMirror.reflectee as DataSource;
        checkDataKeyValidity(dataSource.dataKey);

        final varName = MirrorSystem.getName(varMirrorOnDataSource.simpleName);

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

  return dataSourceInfoList;
}

Future<Map<String, List<DataSourceInfo>>> readGlobalDataSourcesMapped() async {
  final list = await readGlobalDataSources();
  Map<String, List<DataSourceInfo>> map = {};
  for (var item in list) {
    if (map[item.resourceName] == null) {
      map[item.resourceName] = [];
    }
    map[item.resourceName]!.add(item);
  }
  return map;
}

Future<List<DataSourceInfo>> readGlobalDataSources() async {
  final dataSourceGlobe =
      Glob('package:fake_it/src/locales/global/datasources/*.dart');

  final mirrors = currentMirrorSystem()
      .libraries
      .values
      .where((mirror) => dataSourceGlobe.matches(mirror.uri.toString()))
      .toList();

  final dataSourceInfoList = <DataSourceInfo>[];

  for (var mirror in mirrors) {
    for (var varMirrorOnDataSource in mirror.declarations.values
        .whereType<VariableMirror>()
        .where((element) => element.isTopLevel)) {
      final instanceMirror = mirror.getField(varMirrorOnDataSource.simpleName);

      if (instanceMirror.reflectee is DataSource) {
        final dataSource = instanceMirror.reflectee as DataSource;
        checkDataKeyValidity(dataSource.dataKey);

        final varName = MirrorSystem.getName(varMirrorOnDataSource.simpleName);

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

Future createImports() async {
  final libImportsFile = File('scripts/lib_imports.dart');
  if (!libImportsFile.existsSync()) {
    await libImportsFile.create(recursive: true);
  }

  final libDir = Directory('lib');
  final allFiles = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'));

  final buffer = StringBuffer('// ignore_for_file: unused_import\n\n');

  for (var file in allFiles) {
    final uri = file.uri.toString().replaceFirst('lib/', 'package:fake_it/');
    buffer.writeln('import \'$uri\';');
  }

  await libImportsFile.writeAsString(buffer.toString());
}

Future generateLocaleFile(List<String> locales) async {
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

Future generateFakeItClassFile(List<String> locales) async {
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

extension IterableExtensions<T> on Iterable<Iterable<T>> {
  /// Reduces an Iterable<Iterable<T>> to a List<T> with all the items intact.
  ///
  /// This method can be used to avoid calling nested for loops
  List<T> get reduceToList => fold<List<T>>(<T>[], (list, iterable) {
        for (var item in iterable) {
          list.add(item);
        }
        return list;
      });
}

extension IterableExt<T> on Iterable<T> {
  bool containsAll(Iterable<T> otherList) {
    for (var item in otherList) {
      if (!contains(item)) {
        return false;
      }
    }
    return true;
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
        'But variable with name $varName has dataKey with value ${dataSource.dataKey}\n'
        'check file $fileUri\n',
      );
    }
  }

  final String fileUri;
  final String varName;
  final DataSource dataSource;

  String get fileName => fileUri.split('/').last;

  String get resourceName => fileName.split('.').first;

  DataSourceInfo changeLocale(String locale) => DataSourceInfo(
        fileUri: fileUri,
        varName: varName,
        dataSource:
            dataSource.copyWith(locale: FakeItLocale.fromString(locale)),
      );

  @override
  String toString() {
    return 'DataSourceInfo( fileUri = $fileUri | varName = $varName | dataSource = \n$dataSource\n';
  }
}
