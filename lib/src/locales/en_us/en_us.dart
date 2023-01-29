import 'package:fake_it/src/base/base.dart';

import 'package:fake_it/src/locales/en_us/datasources/address.dart' as address1;
import 'package:fake_it/src/locales/en_us/datasources/job.dart' as job1;
import 'package:fake_it/src/locales/en_us/datasources/person.dart' as person1;
import 'package:fake_it/src/locales/en_us/datasources/lorem.dart' as lorem1;

class EnUsCollection extends FakeCollection {
  final FakeItLocale locale;

  EnUsCollection()
      : locale = Locales.en_us,
        super(
          locale: Locales.en_us,
          dataSources: [
            address1.state_abbr,
            address1.state,
            address1.address,
            address1.city_name,
            address1.neighborhood,
            address1.building_number,
            address1.city_suffix,
            address1.street_suffix,
            address1.street_address,
            address1.postcode,
            address1.street_name,
            address1.postcode_format,
            address1.city_prefix,
            address1.secondary_address,
            job1.job_suffix,
            job1.job_title,
            job1.job_prefix,
            person1.first_name_male,
            person1.full_name,
            person1.first_name_female,
            person1.last_name,
            person1.first_name,
            lorem1.sentence,
            lorem1.word,
          ],
        );

  @override
  EnUsAddress get address => EnUsAddress(locale);

  @override
  EnUsPerson get person => EnUsPerson(locale);
}

class EnUsAddress extends Address {
  final FakeItLocale locale;

  EnUsAddress(this.locale) : super(locale);

  String get state_abbr => provide(DataKeys.state_abbr, locale);
  String get neighborhood => provide(DataKeys.neighborhood, locale);
  String get city_suffix => provide(DataKeys.city_suffix, locale);
  String get street_suffix => provide(DataKeys.street_suffix, locale);
  String get street_address => provide(DataKeys.street_address, locale);
  String get postcode_format => provide(DataKeys.postcode_format, locale);
  String get city_prefix => provide(DataKeys.city_prefix, locale);
  String get secondary_address => provide(DataKeys.secondary_address, locale);
}

class EnUsPerson extends Person {
  final FakeItLocale locale;

  EnUsPerson(this.locale) : super(locale);

  String get first_name_male => provide(DataKeys.first_name_male, locale);
  String get first_name_female => provide(DataKeys.first_name_female, locale);
}
