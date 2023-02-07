import 'package:fake_it/src/base/base.dart';

final _hexColorValues = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  0,
  'A',
  'B',
  'C',
  'D',
  'E',
  'F'
];

final color_hex = DataSource.withBuilder(
  dataKey: DataKeys.color_hex,
  locale: Locales.en_us,
  builder: (_) {
    var value = List<String>.generate(
      6,
      (index) => _hexColorValues.randomItem.toString(),
    ).join();

    return '#$value';
  },
);
