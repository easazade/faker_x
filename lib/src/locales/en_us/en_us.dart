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
import 'package:fake_it/src/locales/en_us/datasources/animal.dart' as animal_10;
import 'package:fake_it/src/locales/en_us/datasources/vehicle.dart'
    as vehicle_719;
import 'package:fake_it/src/locales/global/datasources/internet.dart'
    as internet_555;
import 'package:fake_it/src/locales/global/datasources/image.dart' as image_375;
import 'package:fake_it/src/locales/global/datasources/location.dart'
    as location_950;

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
            animal_10.animal_name,
            vehicle_719.car,
            internet_555.http_url,
            internet_555.email,
            internet_555.https_url,
            internet_555.password,
            internet_555.safe_email,
            internet_555.ipv4,
            internet_555.domain_suffixes,
            internet_555.user_name,
            internet_555.uri,
            internet_555.disposable_email,
            internet_555.mac_address,
            internet_555.emoji,
            internet_555.email_from,
            internet_555.ipv6,
            internet_555.mail_provider,
            internet_555.domain_name,
            internet_555.disposable_mail_provider,
            internet_555.user_name_from,
            image_375.image,
            image_375.avatar_uri,
            location_950.geo_location,
          ],
        );

  EnUsAddress get address => EnUsAddress(locale);

  EnUsColor get color => EnUsColor(locale);

  EnUsInternet get internet => EnUsInternet(locale);

  EnUsImage get image => EnUsImage(locale);

  EnUsLocation get location => EnUsLocation(locale);
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

  String get httpUrl => provide(DataKeys.http_url, locale);

  String get httpsUrl => provide(DataKeys.https_url, locale);

  String password(internet_555.PasswordArgs args) =>
      provide(DataKeys.password, locale, args: args);

  String get ipv4 => provide(DataKeys.ipv4, locale);

  String get userName => provide(DataKeys.user_name, locale);

  String uri(internet_555.UriArgs args) =>
      provide(DataKeys.uri, locale, args: args);

  String get macAddress => provide(DataKeys.mac_address, locale);

  String emailFrom(internet_555.EmailArgs args) =>
      provide(DataKeys.email_from, locale, args: args);

  String get ipv6 => provide(DataKeys.ipv6, locale);

  String userNameFrom(internet_555.UsernameArgs args) =>
      provide(DataKeys.user_name_from, locale, args: args);
}

class EnUsImage extends Image {
  final FakeItLocale locale;

  EnUsImage(this.locale) : super(locale);

  String image(image_375.ImageArgs args) =>
      provide(DataKeys.image, locale, args: args);

  String get avatarUri => provide(DataKeys.avatar_uri, locale);
}

class EnUsLocation extends Location {
  final FakeItLocale locale;

  EnUsLocation(this.locale) : super(locale);

  GeoLocation get geoLocation => provide(DataKeys.geo_location, locale);
}
