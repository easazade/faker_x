import 'package:fake_it/src/base/base.dart';

final geo_location = TypeDataSource<GeoLocation, dynamic>.withBuilder(
  dataKey: DataKeys.geo_location,
  locale: Locales.en_us,
  builder: (_, __) => GeoLocation(
    -90 + randomDouble() * 90 * 2,
    -180 + randomDouble() * 180 * 2,
  ),
);
