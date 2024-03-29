// ignore_for_file: unused_import

import 'utils/cli.dart';
import 'utils/utils.dart';
import 'generate.dart' as generate;
import 'register_data_sources.dart' as register_data_sources;
import 'lib_imports.dart';

/// runs generate script for all supported locales in faker_x
/// NOTE: supported locales can be found in lib/src/locales/
Future main(List<String> arguments) async {
  await register_data_sources.main(arguments);

  final locales = await getAvailableLocalesInProject();

  printBlue('Generating FakeCollection classes for all locales');
  for (var locale in locales) {
    await generate.main([locale]);
  }
  printSeparator();
}
