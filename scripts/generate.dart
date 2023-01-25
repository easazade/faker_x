// ignore_for_file: unused_import, curly_braces_in_flow_control_structures

import 'dart:io';
import 'dart:mirrors';

import 'package:fake_it/fake_it.dart';
import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'create_locale.dart';
import 'names.dart';
import 'utils.dart';

final _testArgs = <String>[
  // use for debugging purposes to pass arguments to main
];

Future main(List<String> arguments) async {
  final args = _checkArgs(arguments);

  final locale = args[0];

  checkLocale(locale);

  final dataSourceGlobe =
      Glob('package:fake_it/src/locales/$locale/datasources/*.dart');

  final localizedCollectionFilePath = 'lib/src/locales/$locale/$locale.dart';

  final dataSourcesLibMirrors = currentMirrorSystem()
      .libraries
      .values
      .where((mirror) => dataSourceGlobe.matches(mirror.uri.toString()))
      .toList();

  final definedDataSources = <String>[];
  final dataSourceFilesUri = <String>[];

  for (var dataSourceMirror in dataSourcesLibMirrors) {
    dataSourceFilesUri.add(dataSourceMirror.uri.toString());

    for (var dataSourceVarMirror in dataSourceMirror.declarations.values) {
      if (dataSourceVarMirror is VariableMirror) {
        final dataSourceInstanceMirror =
            dataSourceMirror.getField(dataSourceVarMirror.simpleName);
        if (dataSourceInstanceMirror.reflectee is DataSource) {
          _checkDataKeyValidity(
              dataSourceInstanceMirror.getField(#dataKey).reflectee);
          final dataKey =
              dataSourceInstanceMirror.getField(#dataKey).reflectee as String;
          final varName = MirrorSystem.getName(dataSourceVarMirror.simpleName);
          print('$dataKey == $varName');
          if (dataKey != varName) {
            throw Exception(
                'when defining DataSource variables, name of the variable should be the same as its dataKey value '
                'But $dataKey != $varName');
          }
          definedDataSources.add(varName);
        }
      }
    }
  }

  await _createFakeCollectionClass(
    dataSources: definedDataSources,
    uris: dataSourceFilesUri,
    locale: locale,
    savePath: localizedCollectionFilePath,
  );
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

void _checkDataKeyValidity(dataKey) {
  if (dataKey is! String)
    throw Exception('retreived dataKey is not of type String');
  if (dataKey.isBlank) throw Exception('data key cannot be an empty String');
}

Future _createFakeCollectionClass({
  required List<String> dataSources,
  required List<String> uris,
  required String locale,
  required String savePath,
}) async {
  dataSources.forEach(print);
  uris.insert(0, 'package:fake_it/src/base/base.dart');

  final buffer = StringBuffer();

  for (var uri in uris) {
    buffer.writeln('import \'$uri\';');
  }

  final className = createCollectionClassName(locale);

  buffer.writeln('class $className extends FakeCollection {');

  buffer.writeln('$className()');

  buffer.writeln(':super(');

  buffer.writeln('locale: Locales.$locale,');

  buffer.writeln('dataSources: [');
  for (var item in dataSources) {
    buffer.writeln('$item,');
  }
  buffer.writeln(']');

  buffer.writeln(',);'); // end of super

  buffer.writeln('}'); // end of class

  final file = await File(savePath).create(recursive: true);
  await file.writeAsString(buffer.toString());
}
