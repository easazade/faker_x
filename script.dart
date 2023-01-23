// ignore_for_file: unused_import, curly_braces_in_flow_control_structures

import 'dart:mirrors';

import 'package:fake_it/fake_it.dart';
import 'package:glob/glob.dart';

void main(List<String> args) {
  //TODO: remove hardcoded lcoale and get from args
  final locale = 'xx_xx';

  final dataSourceGlobe =
      Glob('package:fake_it/src/locales/$locale/datasources/*.dart');

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
          checkDataKeyValidity(
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

  createFakeCollectionClass(
    dataSources: definedDataSources,
    uris: dataSourceFilesUri,
    locale: locale,
  );

  // currentMirrorSystem().libraries.values.forEach((element) {
  //   if (element.uri.toString().startsWith('package:fake_it/src/locales/')) {
  //     print(glob.matches(element.uri.toString()));

  //     print(element.uri);
  //     // print('found it');

  //     // print(element.declarations.length);

  //     // element.declarations.forEach((key, value) {
  //     //   print(MirrorSystem.getName(value.simpleName));
  //     // });
  //   }
  // });

  // final libMirror = currentMirrorSystem().findLibrary(Symbol('fake_it'));

  // print(libMirror.declarations.length);

  // for (var element in libMirror.declarations.entries) {
  //   final DeclarationMirror var1 = element.value;
  //   print(var1.simpleName);
  //   print(libMirror.getField(var1.simpleName).reflectee);
  //   // final varMirror = var1 as VariableMirror;
  //   // print(var1);
  // }
}

void checkDataKeyValidity(dataKey) {
  if (dataKey is! String)
    throw Exception('retreived dataKey is not of type String');
  if (dataKey.isBlank) throw Exception('data key cannot be an empty String');
}

void createFakeCollectionClass({
  required List<String> dataSources,
  required List<String> uris,
  required String locale,
}) {
  dataSources.forEach(print);
  uris.add('package:fake_it/src/base/base.dart');
  uris.forEach(print);
}
