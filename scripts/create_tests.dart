// ignore_for_file: unused_import

import 'dart:io';
import 'dart:mirrors';

import 'package:collection/collection.dart';
import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

Future main(List<String> arguments) async {
  final locales = await getAvaialableLocalesInProject();

  for (var locale in locales) {
    final map = await readAvailableDataSourcesForLocaleMapped(locale);
    final testCodes = <String>[];
    final manualTests = <String, String>{};

    for (var entry in map.entries) {
      final resourceName = entry.key;
      final dsInfoList = entry.value;
      var resourceTestCode = await Future.wait(dsInfoList.map((dsInfo) async {
        final code =
            '$assertFunctionName(FakeIt.localized.$locale.$resourceName.${ReCase(dsInfo.varName).camelCase});';
        if (dsInfo.dataSource.builder == null ||
            dsInfo.builderArgsType == 'dynamic') {
          return code;
        } else {
          manualTests['test/manual/${locale}_${dsInfo.varName}_test.dart'] =
              await render(
            'templates/manual_test_file.mustache',
            values: {
              'name': '$locale -> $resourceName -> ${dsInfo.varName} test',
              'description':
                  '// TODO: please write test manually to test FakeIt.localized.$locale.$resourceName.${dsInfo.varName}(args)',
            },
          );
          return null;
        }
      })).then((list) => list.whereNotNull());

      final testCode = StringBuffer();

      testCode.write('for(var i=0; i<$testRepeatCountVarName; i++) {');
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

    for (var entry in manualTests.entries) {
      final path = entry.key;
      final content = entry.value;

      await writeFile(content: content, path: path, overrideContent: false);
    }
  }
}
