import 'package:fake_it/src/base/base.dart';

class DataSource {
  const DataSource({
    required this.dataKey,
    required this.locale,
    required this.values,
    this.formats = const [],
  });

  final String dataKey;
  final FakeItLocale locale;
  final List<Format> formats;
  final List<String> values;

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
}
