import 'package:fake_it/src/base/base.dart';

abstract class BaseDataSource<T, ARG> {
  const BaseDataSource({
    required this.dataKey,
    required this.locale,
    required this.values,
    required this.builder,
  });

  final String dataKey;
  final FakeItLocale locale;
  final List<T> values;
  final Function? builder;

  dynamic build(dynamic args);
}

class DataSource<ARG> extends BaseDataSource<String, ARG> {
  const DataSource({
    required String dataKey,
    required FakeItLocale locale,
    required List<String> values,
    this.formats = const [],
  }) : super(dataKey: dataKey, locale: locale, values: values, builder: null);

  DataSource.withBuilder({
    required String dataKey,
    required FakeItLocale locale,
    required Function builder,
  })  : formats = const [],
        super(dataKey: dataKey, locale: locale, values: [], builder: builder);

  DataSource._({
    required String dataKey,
    required FakeItLocale locale,
    required List<String> values,
    Function? builder,
    this.formats = const [],
  }) : super(
          locale: locale,
          values: values,
          dataKey: dataKey,
          builder: builder,
        );

  final List<Format> formats;

  DataSource copyWith({
    String? dataKey,
    FakeItLocale? locale,
    List<Format>? formats,
    List<String>? values,
    Function? builder,
  }) {
    return DataSource._(
      dataKey: dataKey ?? this.dataKey,
      locale: locale ?? this.locale,
      values: values ?? this.values,
      formats: formats ?? this.formats,
      builder: builder ?? this.builder,
    );
  }

  @override
  StringOrFormat build(dynamic args) {
    if (builder == null) {
      throw Exception(
        'You cannot call build method on this DataSource since no builder was provided in this DataSource '
        'with DataKey=$dataKey',
      );
    }

    final result = builder!(args, locale);

    if (result is Format) {
      return StringOrFormat.format(result);
    } else {
      return StringOrFormat.string(result.toString());
    }
  }
}

class TypeDataSource<T, ARG> extends BaseDataSource<T, ARG> {
  const TypeDataSource({
    required String dataKey,
    required FakeItLocale locale,
    required List<T> values,
  }) : super(dataKey: dataKey, locale: locale, values: values, builder: null);

  TypeDataSource.withBuilder({
    required String dataKey,
    required FakeItLocale locale,
    required Function builder,
  }) : super(dataKey: dataKey, locale: locale, values: [], builder: builder);

  TypeDataSource._({
    required String dataKey,
    required FakeItLocale locale,
    required List<T> values,
    Function? builder,
  }) : super(
          locale: locale,
          values: values,
          dataKey: dataKey,
          builder: builder,
        );

  TypeDataSource copyWith({
    String? dataKey,
    FakeItLocale? locale,
    List<T>? values,
    Function? builder,
  }) {
    return TypeDataSource._(
      dataKey: dataKey ?? this.dataKey,
      locale: locale ?? this.locale,
      values: values ?? this.values,
      builder: builder ?? this.builder,
    );
  }

  @override
  T build(dynamic args) {
    if (builder == null) {
      throw Exception(
        'You cannot call build method on this TypeDataSource since no builder was provided in this DataSource '
        'with DataKey=$dataKey',
      );
    }

    final result = builder!(args, locale);

    if (result is! T) {
      throw Exception(
          'build method should return a ${T.runtimeType} instead ${result.runtimeType} was returned');
    }

    return result;
  }
}

class StringOrFormat {
  final String? string;
  final Format? format;

  StringOrFormat.string(this.string) : format = null;

  StringOrFormat.format(this.format) : string = null;

  bool get isString => string != null;
  bool get isFormat => format != null;
}
