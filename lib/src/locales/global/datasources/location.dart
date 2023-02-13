import 'package:fake_it/src/base/base.dart';

final geo_location = TypeDataSource(
  dataKey: DataKeys.geo_location,
  locale: Locales.en_us,
  values: [
    GeoLocation(43, 34234),
    GeoLocation(3, 213),
    GeoLocation(92292, 2),
  ],
);
