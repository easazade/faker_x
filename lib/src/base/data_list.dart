import 'package:fake_it/src/base/format.dart';

class DataList {
  const DataList({this.formats = const [], required this.values});

  final List<Format> formats;
  final List<String> values;
}
