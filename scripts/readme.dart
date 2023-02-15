// ignore_for_file: unused_import

import 'package:faker_x/faker_x.dart';

import 'lib_imports.dart';
import 'utils/cli.dart';
import 'utils/utils.dart';

Future main(List<String> args) async {
  printYellow('Generating README.md file');
  final buffer = StringBuffer();
  final locales = await getAvaialableLocalesInProject();

  final globalDsInfos = await readGlobalDataSourcesMapped();
  final requiredDsInfos = await readRequiredDataSources();

  buffer.writeln('<table>');

  for (var locale in locales) {
    buffer.writeln('<tr>');

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

    buffer.writeln(
        '<th rowspan="${availableDsInfos.length}" scope="row">$locale</th>');
    buffer.writeln(
        '<td><small>${firstEntry.key}(${firstEntry.value.length}) </small></td>');
    buffer.writeln(
        '<td><small>${firstEntry.value.map((e) => "<span style='color:${colorFor(e.resourceName, e.varName)}'>${e.varName}</span>").join(', ')} </small></td>');
    buffer.writeln('</tr>');

    for (var entry in availableDsInfos.entries.toList().sublist(1)) {
      buffer.writeln('<tr>');
      buffer.writeln(
          '<td><small>${entry.key}(${entry.value.length}) </small></td>');
      buffer.writeln(
          '<td><small>${entry.value.map((e) => "<span style='color:${colorFor(e.resourceName, e.varName)}'>${e.varName}</span>").join(', ')}</small></td>');
      buffer.writeln('</tr>');
    }
  }
  buffer.writeln('</table>');

  await writeFile(content: buffer.toString(), path: 'test.md');
}
