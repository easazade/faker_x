import 'package:fake_it/src/base/format.dart';

class DataList {
  const DataList({
    required this.values,
    this.formats = const [],
  });

  final List<Format> formats;
  final List<String> values;
}
