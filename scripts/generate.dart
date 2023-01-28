// ignore_for_file: unused_import, curly_braces_in_flow_control_structures

import 'dart:developer';
import 'dart:io';
import 'dart:mirrors';

import 'package:fake_it/fake_it.dart';
import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'create_locale.dart';
import 'names.dart';
import 'utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  final args = checkArgs(arguments);

  final locale = args[0];

  checkLocale(locale);

  checkValidityOfDataKeys();

  await createImports();

  final dataSourceInfoList = await readAvailableDataSourcesForLocale(locale);

  final localizedCollectionFilePath = 'lib/src/locales/$locale/$locale.dart';

  await createFakeCollectionClass(
    dataSources: dataSourceInfoList.map((e) => e.varName).toList(),
    uris: dataSourceInfoList.map((e) => e.fileUri).toSet().toList(),
    locale: locale,
    savePath: localizedCollectionFilePath,
  );
}

Future createFakeCollectionClass({
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
