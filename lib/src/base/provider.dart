import 'package:fake_it/src/base/data_source.dart';
import 'package:fake_it/src/base/format.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider_context.dart';
import 'package:fake_it/src/base/utils.dart';

dynamic provide(
  String dataKey,
  FakeItLocale locale, {
  ProviderContext? context,
  dynamic args,
}) {
  context ??= ProviderContext(dataKey: dataKey, locale: locale);

  final localizedDataSourceMap = _localizedProvidersMap[locale];
  if (localizedDataSourceMap == null) {
    throw Exception('There is no localized values available for $locale');
  }

  final dataSource = localizedDataSourceMap[dataKey];
  if (dataSource == null) {
    throw Exception(
      'There are no $dataKey values available for $locale since there are not DataSources registered for it',
    );
  }

  if (dataSource.builder == null) {
    dynamic value = dataSource.values.randomItem;

    final useFormats = !context.hasDuplicateKeyWithPreviousContexts;

    if (dataSource is StringDataSource &&
        dataSource.formats.isNotEmpty &&
        useFormats) {
      final format = dataSource.formats.randomItem;

      if (format != null) {
        final parsedValue = createFakeValueFromFormat(format, locale, context);

        if (value != null) {
          value = coinToss(value, parsedValue);
        } else {
          value = parsedValue;
        }
      }
    }

    if (value == null) {
      throw Exception(
        'could not provide a value for dataKey:$dataKey, locale:$locale, context:$context\n'
        'please check the corresponding datasources and make sure all of them has either values or formats '
        'or if a builder method is provided make sure it is generating a value',
      );
    }

    return value;
  } else {
    final result = dataSource.build(args);

    if (result is StringOrFormat) {
      if (result.isString) {
        return result.string!;
      } else {
        final format = result.format!;
        return createFakeValueFromFormat(format, locale, context);
      }
    }

    return result;
  }
}

String createFakeValueFromFormat(
  Format format,
  FakeItLocale locale,
  ProviderContext context,
) {
  final keys = format.keys;

  final providedValues = keys.map((e) {
    final newContext =
        ProviderContext(dataKey: e, locale: locale, previousContext: context);
    return provide(e, locale, context: newContext) as String;
  }).toList();

  return format.parse(providedValues);
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
