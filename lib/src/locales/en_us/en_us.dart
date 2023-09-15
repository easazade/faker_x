/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make
/// to this file will be removed when code generation takes effect.
///
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

// ignore_for_file: annotate_overrides, unused_import

import 'package:faker_x/src/base/base.dart';

import 'package:faker_x/src/locales/en_us/datasources/address.dart'
    as address_237;
import 'package:faker_x/src/locales/en_us/datasources/animal.dart'
    as animal_354;
import 'package:faker_x/src/locales/en_us/datasources/vehicle.dart'
    as vehicle_661;
import 'package:faker_x/src/locales/global/datasources/color.dart' as color_257;
import 'package:faker_x/src/locales/en_us/datasources/color.dart' as color_180;
import 'package:faker_x/src/locales/global/datasources/person.dart'
    as person_886;
import 'package:faker_x/src/locales/en_us/datasources/person.dart'
    as person_873;
import 'package:faker_x/src/locales/en_us/datasources/phone.dart' as phone_59;
import 'package:faker_x/src/locales/en_us/datasources/job.dart' as job_914;
import 'package:faker_x/src/locales/en_us/datasources/automotive.dart'
    as automotive_744;
import 'package:faker_x/src/locales/global/datasources/lorem.dart' as lorem_536;
import 'package:faker_x/src/locales/en_us/datasources/lorem.dart' as lorem_915;
import 'package:faker_x/src/locales/global/datasources/image.dart' as image_121;
import 'package:faker_x/src/locales/global/datasources/internet.dart'
    as internet_824;
import 'package:faker_x/src/locales/global/datasources/location.dart'
    as location_711;

class EnUsCollection extends FakeCollection {
  EnUsCollection() : super(locale: Locales.en_us);

  EnUsAddress get address => EnUsAddress(locale);

  EnUsColor get color => EnUsColor(locale);

  EnUsJob get job => EnUsJob(locale);

  EnUsLorem get lorem => EnUsLorem(locale);

  EnUsImage get image => EnUsImage(locale);

  EnUsInternet get internet => EnUsInternet(locale);

  EnUsLocation get location => EnUsLocation(locale);
}

class EnUsAddress extends Address {
  final FakerXLocale locale;

  EnUsAddress(this.locale) : super(locale);

  String get cityPrefix => provide(DataKeys.city_prefix, locale);

  String get citySuffix => provide(DataKeys.city_suffix, locale);

  String get neighborhood => provide(DataKeys.neighborhood, locale);

  String get postcodeFormat => provide(DataKeys.postcode_format, locale);

  String get secondaryAddress => provide(DataKeys.secondary_address, locale);

  String get stateAbbr => provide(DataKeys.state_abbr, locale);

  String get streetAddress => provide(DataKeys.street_address, locale);

  String get streetSuffix => provide(DataKeys.street_suffix, locale);
}

class EnUsColor extends Color {
  final FakerXLocale locale;

  EnUsColor(this.locale) : super(locale);

  String get colorHex => provide(DataKeys.color_hex, locale);
}

class EnUsJob extends Job {
  final FakerXLocale locale;

  EnUsJob(this.locale) : super(locale);

  String get jobPrefix => provide(DataKeys.job_prefix, locale);

  String get jobSuffix => provide(DataKeys.job_suffix, locale);
}

class EnUsLorem extends Lorem {
  final FakerXLocale locale;

  EnUsLorem(this.locale) : super(locale);

  String paragraph({
    int maxSentences = 1,
  }) =>
      provide(
        DataKeys.paragraph,
        locale,
        args: lorem_536.ParagraphArgs(
          maxSentences: maxSentences,
        ),
      );
}

class EnUsImage extends Image {
  final FakerXLocale locale;

  EnUsImage(this.locale) : super(locale);

  String get avatarUri => provide(DataKeys.avatar_uri, locale);

  String image({
    required int width,
    required int height,
    required List<String> keywords,
  }) =>
      provide(
        DataKeys.image,
        locale,
        args: image_121.ImageArgs(
          width: width,
          height: height,
          keywords: keywords,
        ),
      );
}

class EnUsInternet extends Internet {
  final FakerXLocale locale;

  EnUsInternet(this.locale) : super(locale);

  String emailFrom({
    String? firstName,
    String? lastName,
    String? provider,
  }) =>
      provide(
        DataKeys.email_from,
        locale,
        args: internet_824.EmailArgs(
          firstName: firstName,
          lastName: lastName,
          provider: provider,
        ),
      );

  String get httpUrl => provide(DataKeys.http_url, locale);

  String get httpsUrl => provide(DataKeys.https_url, locale);

  String get ipv4 => provide(DataKeys.ipv4, locale);

  String get ipv6 => provide(DataKeys.ipv6, locale);

  String get macAddress => provide(DataKeys.mac_address, locale);

  String password({
    int length = 10,
    bool onlyNumeric = false,
  }) =>
      provide(
        DataKeys.password,
        locale,
        args: internet_824.PasswordArgs(
          length: length,
          onlyNumeric: onlyNumeric,
        ),
      );

  String uri({
    required String protocol,
  }) =>
      provide(
        DataKeys.uri,
        locale,
        args: internet_824.UriArgs(
          protocol: protocol,
        ),
      );

  String get userName => provide(DataKeys.user_name, locale);

  String userNameFrom({
    String? firstName,
    String? lastName,
  }) =>
      provide(
        DataKeys.user_name_from,
        locale,
        args: internet_824.UsernameArgs(
          firstName: firstName,
          lastName: lastName,
        ),
      );
}

class EnUsLocation extends Location {
  final FakerXLocale locale;

  EnUsLocation(this.locale) : super(locale);

  GeoLocation get geoLocation => provide(DataKeys.geo_location, locale);
}
