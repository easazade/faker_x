// ignore_for_file: unused_import

import 'package:faker_x/faker_x.dart';

import 'lib_imports.dart';
import 'utils/cli.dart';
import 'utils/utils.dart';

Future main(List<String> args) async {
  printYellow('Generating README.md file');
  final tableOfLocales = StringBuffer(
      'Fake value generators marked in [<span style="color:black">black</span>] are available for all locales and generate the value differently according to that locale.\n '
      'Fake value generators marked in [<span style="color:green">green</span>] are globally shared between different locales and generate values using same methods for all locales.\n'
      'Fake value generator marked in [<span style="color:blue">blue</span>] are the ones that are only available for that locale\n');
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
      tableOfLocales.writeln(
          '<td><small>${entry.value.map((e) => "<span style='color:${colorFor(e.resourceName, e.varName)}'>${e.varName.replaceAll('_', ' ')}</span>").join(' | ')}</small></td>');
      tableOfLocales.writeln('</tr>');
    }
  }
  tableOfLocales.writeln('</table>');

  final readMe = await render('templates/docs/readme.md', values: {
    'table_of_locales': tableOfLocales.toString(),
  });

  await writeFile(content: readMe, path: 'README.md');
  printSeparator();
}
