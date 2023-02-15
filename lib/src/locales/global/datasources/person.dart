import 'package:faker_x/faker_x.dart';
import 'package:faker_x/src/locales/en_us/datasources/person.dart' as person;

final first_name_en = StringDataSource(
  dataKey: DataKeys.first_name_en,
  locale: Locales.en_us,
  values: person.first_name_female.values + person.first_name_male.values,
);

final last_name_en = person.last_name.copyWith(dataKey: DataKeys.last_name_en);
