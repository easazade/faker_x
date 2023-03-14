// ignore_for_file: unused_import

import 'dart:io';

import 'package:faker_x/faker_x.dart';

import 'lib_imports.dart';
import 'utils/cli.dart';
import 'utils/utils.dart';

Future main(List<String> args) async {
  printYellow('Generating README.md file');
  final tableOfLocales = StringBuffer(
      'Below you can see a table of all the locales and all the resources and values that are available for them.<br><br>\n'
      '- Fake value generators marked in [<span style="color:black">black</span>] are available for all locales and generate the value differently according to that locale.<br>\n '
      '- Fake value generators marked in [<span style="color:green">green</span>]🟢 are globally shared between different locales and generate values using same methods for all locales.<br>\n'
      '- Fake value generator marked in [<span style="color:blue">blue</span>]🔵 are the ones that are only available for that locale<br>\n');
  final locales = await getAvaialableLocalesInProject();

  final globalDatasourceInfos = await readGlobalDataSourcesMapped();
  final requiredDatasourceInfos = await readRequiredDataSources();

  tableOfLocales.writeln('<table>');

  for (var locale in locales) {
    final availableDatasourceInfos =
        await readAvailableDataSourcesForLocaleMapped(locale);

    final localDatasourceInfos = await readAvailableDataSourcesForLocaleMapped(
        locale,
        includeGlobals: false);

    for (var i = 0; i < availableDatasourceInfos.entries.length; i++) {
      final entry = availableDatasourceInfos.entries.toList()[i];
      tableOfLocales.writeln('<tr>');

      if (i == 0) {
        tableOfLocales.writeln(
            '<th rowspan="${availableDatasourceInfos.length}" scope="row">$locale</th>');
      }
      tableOfLocales.writeln(
          '<td><small>${entry.key}(${entry.value.length}) </small></td>');

      final fakeGenerators = entry.value.map((e) {
        final color = colorFor(
          resource: e.resourceName,
          data: e.varName,
          globalDatasourceInfos: globalDatasourceInfos,
          requiredDatasourceInfos: requiredDatasourceInfos,
          localDatasourceInfos: localDatasourceInfos,
        );
        var name = e.varName.replaceAll('_', ' ');
        final circle = circleFor(
          resource: e.resourceName,
          data: e.varName,
          globalDatasourceInfos: globalDatasourceInfos,
          requiredDatasourceInfos: requiredDatasourceInfos,
          localDatasourceInfos: localDatasourceInfos,
        );
        if (!circle.isBlank) name += ' $circle';
        return "<span style='color:$color'>$name</span>";
      }).join(' | ');

      tableOfLocales.writeln('<td><small>$fakeGenerators</small></td>');
      tableOfLocales.writeln('</tr>');
    }
  }
  tableOfLocales.writeln('</table>');

  // 🤷 for some reason rendering mustache when there are emojis in it fails and gets messed up.
  // put time and fix later if needed.
  // so we are using replaceAll() of string object instead of mustache.
  // final content = await render('templates/docs/readme.md', values: {
  //   'table_of_locales': tableOfLocales.toString(),
  // });

  final file = File('templates/readme.md');
  var content = await file.readAsString();
  content = content.replaceAll('{{badges}}', await badges());
  content =
      content.replaceAll('{{table_of_locales}}', tableOfLocales.toString());

  await writeFile(content: content, path: 'README.md');
  printSeparator();
}

Future<String> badges() async {
  final style = 'flat-square'; // flat, flat-square, for-the-badge

  final badges = [
    '<img alt="CI Build Checks" src="https://img.shields.io/github/actions/workflow/status/easazade/faker_x/test.yaml?branch=master&style=$style">',
    '<img alt="Pub Version" src="https://img.shields.io/pub/v/faker_x?style=$style">',
    '<img alt="Pub Popularity" src="https://img.shields.io/pub/popularity/faker_x?style=$style">',
    '<img alt="Pub Points" src="https://img.shields.io/pub/points/faker_x?style=$style">',
    '<img alt="Pub Likes" src="https://img.shields.io/pub/likes/faker_x?style=$style">',
    '<img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/easazade/faker_x?style=$style">',
    '<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/easazade/faker_x?style=$style">',
    '<img alt="Pub Publisher" src="https://img.shields.io/pub/publisher/faker_x?style=$style">',
    '<img alt="GitHub" src="https://img.shields.io/github/license/easazade/faker_x?style=$style">',
  ];

  return '<p align="center"> ${badges.join(' ')} </p>';
}

String circleFor({
  required String resource,
  required String data,
  required Map<String, List<DataSourceInfo>> globalDatasourceInfos,
  required Map<String, List<DataSourceInfo>> localDatasourceInfos,
  required Map<String, List<String>> requiredDatasourceInfos,
}) {
  final isGlobal = globalDatasourceInfos[resource]
          ?.where((e) => e.varName == data)
          .isNotEmpty ??
      false;

  final isRequired =
      requiredDatasourceInfos[resource]?.where((e) => e == data).isNotEmpty ??
          false;

  final isLocalized = localDatasourceInfos[resource]
          ?.where((e) => e.varName == data)
          .isNotEmpty ??
      false;

  if (isGlobal) {
    return '🟢';
  } else if (isRequired) {
    return '';
  } else if (isLocalized) {
    return '🔵';
  } else {
    return '';
  }
}

String colorFor({
  required String resource,
  required String data,
  required Map<String, List<DataSourceInfo>> globalDatasourceInfos,
  required Map<String, List<DataSourceInfo>> localDatasourceInfos,
  required Map<String, List<String>> requiredDatasourceInfos,
}) {
  final isGlobal = globalDatasourceInfos[resource]
          ?.where((e) => e.varName == data)
          .isNotEmpty ??
      false;

  final isRequired =
      requiredDatasourceInfos[resource]?.where((e) => e == data).isNotEmpty ??
          false;

  final isLocalized = localDatasourceInfos[resource]
          ?.where((e) => e.varName == data)
          .isNotEmpty ??
      false;

  if (isGlobal) {
    return 'green';
  } else if (isRequired) {
    return 'black';
  } else if (isLocalized) {
    return 'blue';
  } else {
    return 'black';
  }
}
