// ignore_for_file: unused_import

import 'dart:io';
import 'dart:mirrors';

import 'package:collection/collection.dart';
import 'package:glob/glob.dart';
import 'package:recase/recase.dart';

import 'utils/cli.dart';
import 'utils/names.dart';
import 'utils/utils.dart';
import 'lib_imports.dart';

/// creates test for all fake generator methods of all supported locales in faker_x.
/// NOTE: supported locales can be found in lib/src/locales/
Future main(List<String> arguments) async {
  printYellow('Generating tests');
  final locales = await getAvaialableLocalesInProject();

  for (var locale in locales) {
    final map = await readAvailableDataSourcesForLocaleMapped(locale);
    final testCodes = <String>[];
    final manualTests = <String, String>{};

    for (var entry in map.entries) {
      final resourceName = entry.key;
      final dataSourceInfoList = entry.value;
      var allDataSourcesTestCode =
          await Future.wait(dataSourceInfoList.map((dsInfo) async {
        final code =
            '$assertFunctionName($fakerXClassName.localized.$locale.$resourceName.${ReCase(dsInfo.varName).camelCase});';
        if (dsInfo.dataSource.builder == null ||
            dsInfo.builderArgsType == 'dynamic') {
          return code;
        } else {
          final path = 'test/manual/$locale/${dsInfo.varName}_test.dart';

          manualTests[path] = await render(
            'templates/manual_test_file.mustache',
            values: {
              'name': '$locale -> $resourceName -> ${dsInfo.varName} test',
              'description': '// TODO: please write test manually to test '
                  '$fakerXClassName.localized.$locale.$resourceName.${dsInfo.varName}(args)',
            },
          );
          return null;
        }
      })).then((list) => list.whereNotNull());

      final testCode = StringBuffer();

      testCode.write('for(var i=0; i<$testRepeatCountVarName; i++) {');
      testCode.writeln(allDataSourcesTestCode.join('\n'));
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

    final testFileContent = await render(
      'templates/test_file.mustache',
      values: {'code': testCodes.join('\n\n')},
    );

    await writeFile(
      content: testFileContent,
      path: 'test/${locale}_test.dart',
      header: doNotModifyByHandHeader,
    );

    for (var entry in manualTests.entries) {
      final path = entry.key;
      final manualTestFileContent = entry.value;

      await writeFile(
          content: manualTestFileContent, path: path, overrideContent: false);
    }
  }
}
