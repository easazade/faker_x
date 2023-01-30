// ignore_for_file: unused_import

import 'dart:io';
import 'dart:mirrors';

import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'names.dart';
import 'utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  final locales = await getAvaialableLocalesInProject();

  for (var locale in locales) {
    final map = await readAvailableDataSourcesForLocaleMapped(locale);
    final testCodes = <String>[];

    for (var entry in map.entries) {
      final resourceName = entry.key;
      final dsInfoList = entry.value;
      final resourceTestCode = dsInfoList.map((dsInfo) =>
          'FakeIt.localized.$locale.$resourceName.${ReCase(dsInfo.varName).camelCase};');

      final testCode = StringBuffer();
      testCode.write('for(var i=0; i<100; i++) {');
      testCode.writeln(resourceTestCode.join('\n'));
      testCode.writeln('}');

      testCodes.add(
        await render(
          'templates/test_function.mustache',
          values: {
            'name': '$locale $resourceName test',
            'code': testCode.toString(),
          },
        ),
      );
    }

    final content = await render(
      'templates/test_file.mustache',
      values: {'code': testCodes.join('\n\n')},
    );

    await writeFile(content: content, path: 'test/${locale}_test.dart');
  }
}

ClassMirror _getMirrorOnLocalizedCollectionClass(String locale) {
  final glob = Glob('package:fake_it/src/locales/$locale/$locale.dart');

  final mirror = currentMirrorSystem()
      .libraries
      .values
      .where((mirror) => glob.matches(mirror.uri.toString()))
      .toList()
      .first;

  return mirror.declarations.values
      .whereType<ClassMirror>()
      .where(
        (element) =>
            element.reflectedType.toString() ==
            createCollectionClassName(locale),
      )
      .first;
}
