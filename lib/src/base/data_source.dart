import 'package:fake_it/src/base/base.dart';

class DataSource<T> {
  const DataSource._({
    required this.dataKey,
    required this.locale,
    required this.values,
    this.formats = const [],
    this.builder,
  });

  const factory DataSource({
    required String dataKey,
    required FakeItLocale locale,
    required List<String> values,
    List<Format> formats,
  }) = DataSource._;

  factory DataSource.withBuilder({
    required String dataKey,
    required FakeItLocale locale,
    required Function builder,
  }) =>
      DataSource._(
        dataKey: dataKey,
        locale: locale,
        values: const [],
        formats: const [],
        builder: builder,
      );

  final String dataKey;
  final FakeItLocale locale;
  final List<Format> formats;
  final List<String> values;
  final Function? builder;

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

  StringOrFormat build(dynamic args) {
    // if (args == null) {
    //   throw Exception(
    //     'null args were passed to DataSource with DataKey = $dataKey',
    //   );
    // }
    if (builder == null) {
      throw Exception(
        'You cannot call build method on this DataSource since no builder was provided in this DataSource '
        'with DataKey=$dataKey',
      );
    }

    final result = builder!(args);

    if (result is Format) {
      return StringOrFormat.format(result);
    } else {
      return StringOrFormat.string(result.toString());
    }
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
