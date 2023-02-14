import 'package:fake_it/fake_it.dart';

final phone_number = StringDataSource(
  dataKey: DataKeys.phone_number,
  locale: Locales.en_us,
  values: [],
  formats: [
    Format('##########'),
  ],
);

final international_phone_number = StringDataSource(
  dataKey: DataKeys.international_phone_number,
  locale: Locales.en_us,
  values: [],
  formats: [
    Format('+1##########'),
    Format('001##########'),
  ],
);
