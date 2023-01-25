import 'package:fake_it/src/base/data_source.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider_context.dart';
import 'package:fake_it/src/base/utils.dart';

String provide(
  String dataKey,
  FakeItLocale locale, {
  ProviderContext? context,
}) {
  context ??= ProviderContext(dataKey: dataKey, locale: locale);

  final localizedDataSourceMap = _localizedProvidersMap[locale];
  if (localizedDataSourceMap == null) {
    throw Exception('There is no localized values available for $locale');
  }

  final dataSource = localizedDataSourceMap[dataKey];
  if (dataSource == null) {
    throw Exception('There are no $dataKey values available for $locale');
  }

  String value = dataSource.values.randomItem;

  final useFormats = !context.hasDuplicateKeyWithPreviousContexts;

  if (dataSource.formats.isNotEmpty && useFormats) {
    final format = dataSource.formats.randomItem;
    final keys = format.keys;
    final values = keys.map((e) {
      final newContext =
          ProviderContext(dataKey: e, locale: locale, previousContext: context);
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

  dataSources![dataSource.dataKey] = dataSource;
}

final Map<FakeItLocale, Map<String, DataSource>> _localizedProvidersMap = {};
