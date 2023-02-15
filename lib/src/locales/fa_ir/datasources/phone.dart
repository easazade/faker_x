import 'package:faker_x/faker_x.dart';

final phone_number = StringDataSource(
  dataKey: DataKeys.phone_number,
  locale: Locales.en_us,
  values: [],
  formats: [
    Format('09#########'),
  ],
);

final international_phone_number = StringDataSource(
  dataKey: DataKeys.international_phone_number,
  locale: Locales.en_us,
  values: [],
  formats: [
    Format('+989#########'),
    Format('00989#########'),
  ],
);
