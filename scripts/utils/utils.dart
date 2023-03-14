// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';
import 'package:collection/collection.dart';
import 'package:faker_x/faker_x.dart';
import 'package:glob/glob.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:recase/recase.dart';
import 'package:yaml/yaml.dart';
import '../lib_imports.dart';
import 'cli.dart';
import 'names.dart';

/// only use for debug & testing purposes
const _testArgs = <String>['en_us'];

List<String> checkArgs(List<String> args) {
  if (args.isEmpty && _testArgs.isNotEmpty) {
    return _testArgs;
  }
  if (args.isEmpty) {
    exitWithMsg(error: 'Please pass locale as argument\nEG: en_us');
  }

  return args;
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
///
/// [overrideContent] set to true by default. if set to false file and file exists file
/// will not be changed. meaning new [content] will not be written to file
Future writeFile({
  required String content,
  required String path,
  bool overrideContent = true,
  String? header,
}) async {
  final file = File(path);
  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }
  if (overrideContent || file.readAsStringSync().isBlank) {
    if (header != null) {
      content = header + content;
    }
    file.writeAsStringSync(content);
  }
}

void checkDataKeyValidity(dataKey) {
  if (dataKey is! String) {
    exitWithMsg(error: 'retreived dataKey is not of type String');
  }

  if ((dataKey as String).isBlank) {
    exitWithMsg(error: 'data key cannot be an empty String');
  }
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
/// eg: if right now faker_x has multilingual support for 10 locales like en_us, fa_ir etc they will be returned
Future<List<String>> getAvaialableLocalesInProject() async {
  final dir = Directory('lib/src/locales/');
  final List<FileSystemEntity> entities = await dir.list().toList();
  return entities.map((e) => e.path.split('/').last).toList()
    ..remove('global')
    ..sortBy((element) => element);
}

Future<Map<String, List<String>>> getUnavailableDataSourceNames() async {
  final unavailableDataSources = await readRequiredDataSources();
  final globalDataSources = await readGlobalDataSourcesMapped();
  for (var entry in globalDataSources.entries) {
    final resouceName = entry.key;
    final dsInfos = entry.value;

    for (var dsInfo in dsInfos) {
      unavailableDataSources[resouceName]
          ?.removeWhere((dsName) => dsInfo.varName == dsName);
    }
  }

  return unavailableDataSources..removeWhere((key, list) => list.isEmpty);
}

Future<Map<String, List<String>>> readRequiredDataSources() async {
  final dataSourceGlobe = Glob('package:faker_x/src/base/resources.dart');

  final libMirror = currentMirrorSystem()
      .libraries
      .values
      .where((mirror) => dataSourceGlobe.matches(mirror.uri.toString()))
      .toList()
      .first;

  Map<String, List<String>> requiredResources = {};

  final resourcesMirrors = libMirror.declarations.entries
      .where((element) {
        return element.value is ClassMirror &&
            !(element.value as ClassMirror).isAbstract &&
            (element.value as ClassMirror).metadata.firstOrNull != null &&
            (element.value as ClassMirror).metadata.first.reflectee
                is BaseResource;
      })
      .toList()
      .sortedBy((element) => MirrorSystem.getName(element.key));

  for (var entry in resourcesMirrors) {
    final resourceName = MirrorSystem.getName(entry.key).toLowerCase();
    final mirrorOnResource = entry.value as ClassMirror;

    final isRequiredResource =
        mirrorOnResource.metadata.first.getField(#isRequired).reflectee as bool;

    if (isRequiredResource) {
      for (var getter in mirrorOnResource.declarations.entries
          .where((element) =>
              element.value is MethodMirror &&
              !(element.value as MethodMirror).isConstructor)
          .sortedBy((element) => MirrorSystem.getName(element.key))) {
        final getterSymbol = getter.key;

        final getterName = MirrorSystem.getName(getterSymbol);
        if (requiredResources[resourceName] == null) {
          requiredResources[resourceName] = [];
        }

        if (getterName != getterName.camelCase) {
          exitWithMsg(
            error:
                'All getter methods for resource classes defined in $resourcesAddress should have their methods names '
                'in camel case notation but getter method "$getterName" isn\'t. please fix that and try again',
          );
        }

        requiredResources[resourceName]!.add(getterName.snakeCase);
      }
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
  final globalDataSourcesMap = await readGlobalDataSourcesMapped();

  for (var resource in globalDataSourcesMap.keys) {
    final globalDataSources = globalDataSourcesMap[resource] ?? [];

    final localDataSources = map[resource] ?? [];

    final availableDataSources = <DataSourceInfo>[...localDataSources];
    for (var globalDs in globalDataSources) {
      final thereIsNoLocalDataSourceAvailable = localDataSources
          .where((localDs) => localDs.varName == globalDs.varName)
          .isEmpty;

      if (thereIsNoLocalDataSourceAvailable) {
        availableDataSources.add(globalDs);
      }
    }
    map[resource] = [...globalDataSources, ...localDataSources]
        .map((e) => e.changeLocale(locale))
        .toList();
  }

  return map;
}

Future<List<DataSourceInfo>> readAvailableDataSourcesForLocale(
  String locale,
) async {
  final dataSourceGlobe =
      Glob('package:faker_x/src/locales/$locale/datasources/*.dart');

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

        final typeArgs = instanceMirror.type.superclass!.typeArguments;
        final builderArgDeclarationMirror = typeArgs[1].originalDeclaration;

        final builderArgFields = <MethodArguemnt>[];

        if (builderArgDeclarationMirror is ClassMirror) {
          final constructorParameters = builderArgDeclarationMirror
              .declarations.values
              .whereType<MethodMirror>()
              .first
              .parameters;

          for (var param in constructorParameters) {
            builderArgFields.add(MethodArguemnt(
              type: param.type.reflectedType.toString(),
              name: MirrorSystem.getName(param.simpleName),
              isRequired: !param.isOptional,
              defaultValue:
                  param.hasDefaultValue ? param.defaultValue!.reflectee : null,
            ));
          }
        }

        dataSourceInfoList.add(
          DataSourceInfo(
            fileUri: mirror.uri.toString(),
            varName: varName,
            generatedValueType: typeArgs[0].reflectedType.toString(),
            builderArgsType: typeArgs[1].reflectedType.toString(),
            dataSource: dataSource,
            builderArgTypeFields: builderArgFields,
          ),
        );
      }
    }
  }

  return dataSourceInfoList..sortBy((element) => element.varName);
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
      Glob('package:faker_x/src/locales/global/datasources/*.dart');

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

        final typeArgs = instanceMirror.type.superclass!.typeArguments;
        final builderArgDeclarationMirror = typeArgs[1].originalDeclaration;

        final builderArgFields = <MethodArguemnt>[];

        if (builderArgDeclarationMirror is ClassMirror) {
          final constructorParameters = builderArgDeclarationMirror
              .declarations.values
              .whereType<MethodMirror>()
              .first
              .parameters;

          for (var param in constructorParameters) {
            final hasNonNullableAnnotation =
                (param.metadata.firstOrNull != null)
                    ? param.metadata.firstOrNull!.reflectee == nonNullable
                    : false;

            builderArgFields.add(MethodArguemnt(
              type: param.type.reflectedType.toString(),
              name: MirrorSystem.getName(param.simpleName),
              isRequired: !param.isOptional || hasNonNullableAnnotation,
              defaultValue:
                  param.hasDefaultValue ? param.defaultValue!.reflectee : null,
            ));
          }
        }

        dataSourceInfoList.add(
          DataSourceInfo(
            fileUri: mirror.uri.toString(),
            varName: varName,
            generatedValueType: typeArgs[0].reflectedType.toString(),
            builderArgsType: typeArgs[1].reflectedType.toString(),
            dataSource: dataSource,
            builderArgTypeFields: builderArgFields,
          ),
        );
      }
    }
  }

  return dataSourceInfoList..sortBy((element) => element.varName);
}

void checkValidityOfDataKeys() {
  final dataSourceGlobe = Glob('package:faker_x/src/base/keys.dart');

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
      exitWithMsg(
        error:
            'Found a data key in ${libMirror.uri} with unequal value and variable name\n'
            'eg: $varName != $value\n'
            'Please Fix that first, then run the command again',
      );
    }
  }
}

Future createScriptsImportsFile() async {
  final libImportsFile = File('scripts/lib_imports.dart');
  if (!libImportsFile.existsSync()) {
    await libImportsFile.create(recursive: true);
  }
  final oldLines = await libImportsFile.readAsLines();

  final libDir = Directory('lib');
  final allFiles = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .sortedBy((element) => element.fileName);

  final buffer = StringBuffer('// ignore_for_file: unused_import\n\n');

  final newLines = <String>[];

  for (var file in allFiles) {
    final uri = file.uri.toString().replaceFirst('lib/', 'package:faker_x/');
    final importPhrase = 'import \'$uri\';';
    newLines.add(importPhrase);
    buffer.writeln(importPhrase);
  }

  await libImportsFile
      .writeAsString(doNotModifyByHandHeader + buffer.toString());

  newLines.removeWhere((element) => element.isBlank);

  if (!oldLines.containsAll(newLines)) {
    exitWithMsg(
      info: 'scripts/lib_imports.dart needed to be updated !!',
      warning: 'PLEASE Run command again',
      printStackTrace: false,
    );
  }
}

Future generateLocaleFile(List<String> locales) async {
  final localesContent = await render('templates/locale.mustache', values: {
    'locales': locales.map(
      (locale) {
        final parts = locale.split('_');
        return "static const $locale = $fakerXLocaleClassName('${parts[0]}', '${(parts.length > 1 ? parts[1] : '')}');";
      },
    ),
  });

  await writeFile(
    path: 'lib/src/base/locale.dart',
    content: localesContent,
    header: doNotModifyByHandHeader,
  );
}

Future generateFakeCollectionFile() async {
  final requiredResources = await readRequiredDataSources()
      .then((e) => e.keys.toList()..sortBy((element) => element));

  final assignings = requiredResources
      .map((res) =>
          '${res.camelCase} = ${res.pascalCase}(locale)${res != requiredResources.last ? "," : ""}')
      .join();

  final fields = requiredResources
      .map((res) => 'final ${res.pascalCase} ${res.camelCase};');

  final fakeCollectionClassFile = await render(
    'templates/fake_collection_file.mustache',
    values: {'assignings': assignings, 'fields': fields},
  );

  await writeFile(
    path: 'lib/src/base/fake_collection.dart',
    content: fakeCollectionClassFile,
    header: doNotModifyByHandHeader,
  );
}

Future generateFakerXClassFile(List<String> locales) async {
  final buffer = StringBuffer();

  for (var locale in locales) {
    buffer.writeln(
        'import \'package:faker_x/src/locales/$locale/$locale.dart\';');
  }

  // write class FakerX
  buffer.writeln('class $fakerXClassName {');
  buffer.writeln('$fakerXClassName._();\n');

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
    path: 'lib/src/base/faker_x_class.dart',
    content: buffer.toString(),
    header: doNotModifyByHandHeader,
  );
}

/// reads a the content of a json/yaml file and returns it as a [Map<String,dynamic>]
/// the method samrtly :D differs yaml files from json files
///
/// if the provided file is not json or yaml or the content is not valid an [UnsupportedFileException] will be thrown
Future<Map<String, dynamic>> readJsonOrYamlFile(File file) async {
  try {
    var fileContent = await file.readAsString();
    return _readJsonOrYaml(fileContent);
  } catch (e, _) {
    exitWithMsg(
      error: 'Unsupported File: make sure the file '
          'content is in correct json or yaml format',
      info: 'file path is ${file.path}',
    );
    exit(-1); // this is unreachable
  }
}

Map<String, dynamic> readJsonOrYaml(String content) {
  try {
    return _readJsonOrYaml(content);
  } catch (e, _) {
    exitWithMsg(
      error: 'Unsupported File: make sure the file '
          'content is in correct json or yaml format',
    );
    exit(-1); // this is unreachable
  }
}

Map<String, dynamic> _readJsonOrYaml(String content) {
  if (content.startsWith('{')) {
    var json = jsonDecode(content);
    return json;
  } else {
    YamlMap yaml = loadYaml(content);
    var map = jsonDecode(jsonEncode(yaml)) as Map<String, dynamic>;
    return map;
  }
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

extension FileExt on File {
  String get fileName => path.split('/').last;
}

class DataSourceInfo {
  DataSourceInfo({
    required this.fileUri,
    required this.varName,
    required this.builderArgsType,
    required this.dataSource,
    required this.generatedValueType,
    required this.builderArgTypeFields,
  }) {
    if (varName != dataSource.dataKey) {
      exitWithMsg(
        error:
            'when defining DataSource variables, name of the variable should be the same as its dataKey value '
            'But variable with name $varName has dataKey with value ${dataSource.dataKey}\n'
            'check file $fileUri\n',
      );
    }
  }

  final String fileUri;
  final String varName;
  final String builderArgsType;
  final DataSource dataSource;
  final String generatedValueType;
  final List<MethodArguemnt> builderArgTypeFields;

  String get fileName => fileUri.split('/').last;

  String get resourceName => fileName.split('.').first;

  String get directiveRef =>
      '${resourceName}_${(fileUri.hashCode ~/ 1100000).abs()}';

  String get importCodePhrase => 'import \'$fileUri\' as $directiveRef;';

  DataSourceInfo changeLocale(String locale) => DataSourceInfo(
        fileUri: fileUri,
        varName: varName,
        builderArgsType: builderArgsType,
        generatedValueType: generatedValueType,
        builderArgTypeFields: builderArgTypeFields,
        dataSource:
            dataSource.copyWith(locale: FakerXLocale.fromString(locale)),
      );

  @override
  String toString() {
    return 'DataSourceInfo( fileUri = $fileUri | varName = $varName | dataSource = \n$dataSource\n';
  }
}

class MethodArguemnt {
  final String type;
  final String name;
  final bool isRequired;
  final dynamic defaultValue;

  MethodArguemnt({
    required this.type,
    required this.name,
    required this.isRequired,
    this.defaultValue,
  });
}
