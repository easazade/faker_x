// ignore_for_file: unused_import

import 'dart:io';

import 'package:faker_x/faker_x.dart';

import 'lib_imports.dart';
import 'utils/cli.dart';
import 'utils/utils.dart';

Future main(List<String> args) async {
  printYellow('Generating README.md file');
  final tableOfLocales = StringBuffer(
      'Below you can see a table of all the locales and all the resource and values that are available for them.<br><br>\n'
      '- Fake value generators marked in [<span style="color:black">black</span>] are available for all locales and generate the value differently according to that locale.<br>\n '
      '- Fake value generators marked in [<span style="color:green">green</span>]🟢 are globally shared between different locales and generate values using same methods for all locales.<br>\n'
      '- Fake value generator marked in [<span style="color:blue">blue</span>]🔵 are the ones that are only available for that locale<br>\n');
  final locales = await getAvaialableLocalesInProject();

  final globalDsInfos = await readGlobalDataSourcesMapped();
  final requiredDsInfos = await readRequiredDataSources();

  tableOfLocales.writeln('<table>');

  for (var locale in locales) {
    tableOfLocales.writeln('<tr>');

    final availableDsInfos =
        await readAvailableDataSourcesForLocaleMapped(locale);

    final localDsInfos = await readAvailableDataSourcesForLocaleMapped(locale,
        includeGlobals: false);

    String colorFor(String resource, String data) {
      final isGlobal =
          globalDsInfos[resource]?.where((e) => e.varName == data).isNotEmpty ??
              false;

      final isRequired =
          requiredDsInfos[resource]?.where((e) => e == data).isNotEmpty ??
              false;

      final isLocalized =
          localDsInfos[resource]?.where((e) => e.varName == data).isNotEmpty ??
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

    String circleFor(String resource, String data) {
      final isGlobal =
          globalDsInfos[resource]?.where((e) => e.varName == data).isNotEmpty ??
              false;

      final isRequired =
          requiredDsInfos[resource]?.where((e) => e == data).isNotEmpty ??
              false;

      final isLocalized =
          localDsInfos[resource]?.where((e) => e.varName == data).isNotEmpty ??
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

    final firstEntry = availableDsInfos.entries.first;

    tableOfLocales.writeln(
        '<th rowspan="${availableDsInfos.length}" scope="row">$locale</th>');
    tableOfLocales.writeln(
        '<td><small>${firstEntry.key}(${firstEntry.value.length}) </small></td>');
    tableOfLocales.writeln(
        '<td><small>${firstEntry.value.map((e) => "<span style='color:${colorFor(e.resourceName, e.varName)}'>${e.varName.replaceAll('_', ' ')}</span>").join(' | ')} </small></td>');
    tableOfLocales.writeln('</tr>');

    for (var entry in availableDsInfos.entries.toList().sublist(1)) {
      tableOfLocales.writeln('<tr>');
      tableOfLocales.writeln(
          '<td><small>${entry.key}(${entry.value.length}) </small></td>');

      final fakeGenerators = entry.value.map((e) {
        final color = colorFor(e.resourceName, e.varName);
        var name = e.varName.replaceAll('_', ' ');
        final circle = circleFor(e.resourceName, e.varName);
        if (!circle.isBlank) name += ' $circle';
        return "<span style='color:$color'>$name</span>";
      }).join(' | ');

      tableOfLocales.writeln('<td><small>$fakeGenerators</small></td>');
      tableOfLocales.writeln('</tr>');
    }
  }
  tableOfLocales.writeln('</table>');

  // 🤷 for some reason rendering mustache when there are emojis in it fails and gets messed up. fix later if needed.
  // final content = await render('templates/docs/readme.md', values: {
  //   'table_of_locales': tableOfLocales.toString(),
  // });

  final file = File('templates/docs/readme.md');
  var content = await file.readAsString();
  content = content.replaceAll('{{tags}}', await tags());
  content =
      content.replaceAll('{{table_of_locales}}', tableOfLocales.toString());

  await writeFile(content: content, path: 'README.md');
  printSeparator();
}

Future<String> tags() async {
  final pubspec = await readJsonOrYamlFile(File('pubspec.yaml'));
  final version = pubspec['version'];

  final style = 'flat-square'; // flat, flat-square, for-the-badge

  return '''
<img src="https://img.shields.io/github/actions/workflow/status/easazade/faker_x/test.yaml?branch=master&style=$style">

<img src="https://img.shields.io/badge/pub-$version-blue?style=$style">

<img alt="Pub Popularity" src="https://img.shields.io/pub/popularity/faker_x?style=$style">

<img alt="Pub Likes" src="https://img.shields.io/pub/likes/faker_x?style=$style">

<img alt="Pub Points" src="https://img.shields.io/pub/points/faker_x?style=$style">

<img alt="Pub Publisher" src="https://img.shields.io/pub/publisher/faker_x?style=$style">

<img alt="GitHub" src="https://img.shields.io/github/license/easazade/faker_x?style=$style">

''';
}
