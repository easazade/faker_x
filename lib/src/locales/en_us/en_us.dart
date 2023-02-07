// ignore_for_file: annotate_overrides

import 'package:fake_it/src/base/base.dart';

import 'package:fake_it/src/locales/en_us/datasources/address.dart' as address1;
import 'package:fake_it/src/locales/en_us/datasources/job.dart' as job1;
import 'package:fake_it/src/locales/en_us/datasources/person.dart' as person1;
import 'package:fake_it/src/locales/en_us/datasources/automotive.dart'
    as automotive1;
import 'package:fake_it/src/locales/en_us/datasources/color.dart' as color1;
import 'package:fake_it/src/locales/en_us/datasources/lorem.dart' as lorem1;
import 'package:fake_it/src/locales/en_us/datasources/vehicle.dart' as vehicle1;
import 'package:fake_it/src/locales/global/datasources/image.dart' as image1;

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
            automotive1.license_plate,
            color1.color_hex,
            color1.color_name,
            lorem1.sentence,
            lorem1.word,
            vehicle1.car,
            image1.image,
          ],
        );

  EnUsAddress get address => EnUsAddress(locale);

  EnUsPerson get person => EnUsPerson(locale);

  EnUsColor get color => EnUsColor(locale);

  EnUsImage get image => EnUsImage(locale);
}

class EnUsAddress extends Address {
  final FakeItLocale locale;

  EnUsAddress(this.locale) : super(locale);

  String get stateAbbr => provide(DataKeys.state_abbr, locale);
  String get neighborhood => provide(DataKeys.neighborhood, locale);
  String get citySuffix => provide(DataKeys.city_suffix, locale);
  String get streetSuffix => provide(DataKeys.street_suffix, locale);
  String get streetAddress => provide(DataKeys.street_address, locale);
  String get postcodeFormat => provide(DataKeys.postcode_format, locale);
  String get cityPrefix => provide(DataKeys.city_prefix, locale);
  String get secondaryAddress => provide(DataKeys.secondary_address, locale);
}

class EnUsPerson extends Person {
  final FakeItLocale locale;

  EnUsPerson(this.locale) : super(locale);

  String get firstNameMale => provide(DataKeys.first_name_male, locale);
  String get firstNameFemale => provide(DataKeys.first_name_female, locale);
}

class EnUsColor extends Color {
  final FakeItLocale locale;

  EnUsColor(this.locale) : super(locale);

  String get colorHex => provide(DataKeys.color_hex, locale);
}

class EnUsImage extends Image {
  final FakeItLocale locale;

  EnUsImage(this.locale) : super(locale);

  String image(image1.ImageArgs args) =>
      provide(DataKeys.image, locale, args: args);
}
