import 'package:fake_it/src/base/base.dart';

class DataSource<T extends BaseArgs> {
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

  factory DataSource.builder({
    required String dataKey,
    required FakeItLocale locale,
    required String Function(T args) builder,
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
  final String Function(T args)? builder;

  DataSource copyWith({
    String? dataKey,
    FakeItLocale? locale,
    List<Format>? formats,
    List<String>? values,
  }) {
    return DataSource(
      dataKey: dataKey ?? this.dataKey,
      locale: locale ?? this.locale,
      values: values ?? this.values,
      formats: formats ?? this.formats,
    );
  }

  String build(T? args) {
    if (args == null) {
      throw Exception(
        'null args were passed to DataSource with DataKey = $dataKey',
      );
    }
    if (builder == null) {
      throw Exception(
        'You cannot call build method on this DataSource since no builder was provided in this DataSource '
        'with DataKey=$dataKey',
      );
    }
    return builder!(args);
  }
}

abstract class BaseArgs {}
