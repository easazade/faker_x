import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/en_us/datasources/person.dart' as person;

final first_name_en = DataSource(
  dataKey: DataKeys.first_name_en,
  locale: Locales.en_us,
  values: person.first_name_female.values + person.first_name_male.values,
);

final last_name_en = person.last_name.copyWith(dataKey: DataKeys.last_name_en);
