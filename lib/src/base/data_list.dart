import 'package:fake_it/src/base/base.dart';

class DataSource {
  const DataSource({
    required this.key,
    required this.locale,
    required this.values,
    this.formats = const [],
  });

  final String key;
  final FakeItLocale locale;
  final List<Format> formats;
  final List<String> values;
}
