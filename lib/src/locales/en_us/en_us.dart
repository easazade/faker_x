// ignore_for_file: annotate_overrides

import 'package:fake_it/src/base/base.dart';

import 'package:fake_it/src/locales/en_us/datasources/address.dart'
    as address_917;
import 'package:fake_it/src/locales/en_us/datasources/job.dart' as job_319;
import 'package:fake_it/src/locales/global/datasources/person.dart'
    as person_534;
import 'package:fake_it/src/locales/en_us/datasources/person.dart'
    as person_833;
import 'package:fake_it/src/locales/en_us/datasources/automotive.dart'
    as automotive_673;
import 'package:fake_it/src/locales/global/datasources/color.dart' as color_525;
import 'package:fake_it/src/locales/en_us/datasources/color.dart' as color_48;
import 'package:fake_it/src/locales/en_us/datasources/lorem.dart' as lorem_77;
import 'package:fake_it/src/locales/en_us/datasources/vehicle.dart'
    as vehicle_719;
import 'package:fake_it/src/locales/global/datasources/internet.dart'
    as internet_555;
import 'package:fake_it/src/locales/global/datasources/image.dart' as image_375;

class EnUsCollection extends FakeCollection {
  final FakeItLocale locale;

  EnUsCollection()
      : locale = Locales.en_us,
        super(
          locale: Locales.en_us,
          dataSources: [
            address_917.state_abbr,
            address_917.state,
            address_917.address,
            address_917.city_name,
            address_917.neighborhood,
            address_917.building_number,
            address_917.city_suffix,
            address_917.street_suffix,
            address_917.street_address,
            address_917.postcode,
            address_917.street_name,
            address_917.postcode_format,
            address_917.city_prefix,
            address_917.secondary_address,
            job_319.job_suffix,
            job_319.job_title,
            job_319.job_prefix,
            person_534.last_name_en,
            person_534.first_name_en,
            person_833.first_name_male,
            person_833.full_name,
            person_833.first_name_female,
            person_833.last_name,
            person_833.first_name,
            automotive_673.license_plate,
            color_525.color_hex,
            color_48.color_name,
            lorem_77.sentence,
            lorem_77.word,
            vehicle_719.car,
            internet_555.user_name,
            internet_555.user_name_from,
            image_375.image,
          ],
        );

  EnUsAddress get address => EnUsAddress(locale);

  EnUsColor get color => EnUsColor(locale);

  EnUsInternet get internet => EnUsInternet(locale);

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

class EnUsColor extends Color {
  final FakeItLocale locale;

  EnUsColor(this.locale) : super(locale);

  String get colorHex => provide(DataKeys.color_hex, locale);
}

class EnUsInternet extends Internet {
  final FakeItLocale locale;

  EnUsInternet(this.locale) : super(locale);

  String get userName => provide(DataKeys.user_name, locale);
  String userNameFrom(internet_555.UsernameArgs args) =>
      provide(DataKeys.user_name_from, locale, args: args);
}

class EnUsImage extends Image {
  final FakeItLocale locale;

  EnUsImage(this.locale) : super(locale);

  String image(image_375.ImageArgs args) =>
      provide(DataKeys.image, locale, args: args);
}
