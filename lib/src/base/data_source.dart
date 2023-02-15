import 'package:faker_x/src/base/base.dart';

abstract class DataSource<T, ARG> {
  const DataSource({
    required this.dataKey,
    required this.locale,
    required this.values,
    required this.builder,
  });

  final String dataKey;
  final FakerXLocale locale;
  final List<T> values;
  final Function? builder;

  dynamic build(dynamic args);
}

class StringDataSource<ARG> extends DataSource<String, ARG> {
  const StringDataSource({
    required String dataKey,
    required FakerXLocale locale,
    required List<String> values,
    this.formats = const [],
  }) : super(dataKey: dataKey, locale: locale, values: values, builder: null);

  StringDataSource.withBuilder({
    required String dataKey,
    required FakerXLocale locale,
    required Function builder,
  })  : formats = const [],
        super(dataKey: dataKey, locale: locale, values: [], builder: builder);

  StringDataSource._({
    required String dataKey,
    required FakerXLocale locale,
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

  StringDataSource _copyWith({
    String? dataKey,
    FakerXLocale? locale,
    List<Format>? formats,
    List<String>? values,
    Function? builder,
  }) {
    return StringDataSource._(
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

class TypeDataSource<T, ARG> extends DataSource<T, ARG> {
  const TypeDataSource({
    required String dataKey,
    required FakerXLocale locale,
    required List<T> values,
  }) : super(dataKey: dataKey, locale: locale, values: values, builder: null);

  TypeDataSource.withBuilder({
    required String dataKey,
    required FakerXLocale locale,
    required Function builder,
  }) : super(dataKey: dataKey, locale: locale, values: [], builder: builder);

  TypeDataSource._({
    required String dataKey,
    required FakerXLocale locale,
    required List<T> values,
    Function? builder,
  }) : super(
          locale: locale,
          values: values,
          dataKey: dataKey,
          builder: builder,
        );

  TypeDataSource _copyWith({
    String? dataKey,
    FakerXLocale? locale,
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

extension BaseDataSourceExt on DataSource {
  DataSource copyWith({
    String? dataKey,
    FakerXLocale? locale,
    List<Format>? formats,
    List<String>? values,
    Function? builder,
  }) {
    if (this is StringDataSource) {
      return (this as StringDataSource)._copyWith(
        dataKey: dataKey,
        locale: locale,
        formats: formats,
        values: values,
        builder: builder,
      );
    } else if (this is TypeDataSource) {
      return (this as TypeDataSource)._copyWith(
        dataKey: dataKey,
        locale: locale,
        values: values,
        builder: builder,
      );
    }
    throw Exception('could not clone the DataSource, Unknown Type');
  }
}
