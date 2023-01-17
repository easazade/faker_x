import 'package:fake_it/src/base/data_list.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider_context.dart';
import 'package:fake_it/src/base/utils.dart';

String provide(
  String key,
  FakeItLocale locale, {
  ProviderContext? context,
}) {
  context ??= ProviderContext(key: key, locale: locale);

  final localizedDataSourceMap = _localizedProvidersMap[locale];
  if (localizedDataSourceMap == null) {
    throw Exception('There is no localized values available for $locale');
  }

  final dataSource = localizedDataSourceMap[key];
  if (dataSource == null) {
    throw Exception('There are no $key values available for $locale');
  }

  String value = dataSource.values.randomItem;

  final useFormats =
      !context.hasDuplicateKeyWithPreviousContexts; // causes infinite loop

  if (dataSource.formats.isNotEmpty && useFormats) {
    final format = dataSource.formats.randomItem;
    final keys = format.keys;
    final values = keys.map((e) {
      final newContext =
          ProviderContext(key: e, locale: locale, previousContext: context);
      return provide(e, locale, context: newContext);
    }).toList();
    final parsedValue = format.parse(values);
    value = coinToss(value, parsedValue);
  }

  return value;
}

void registerDataSource(DataSource dataSource) {
  // retriving the dataSources registered for the given locale
  Map<String, DataSource>? dataSources =
      _localizedProvidersMap[dataSource.locale];

  if (dataSources == null) {
    _localizedProvidersMap[dataSource.locale] = <String, DataSource>{};
    dataSources = _localizedProvidersMap[dataSource.locale];
  }

  dataSources![dataSource.key] = dataSource;
}

final Map<FakeItLocale, Map<String, DataSource>> _localizedProvidersMap = {};
