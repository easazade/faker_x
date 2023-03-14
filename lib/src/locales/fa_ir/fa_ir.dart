/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make
/// to this file will be removed when code generation takes effect.
///
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

// ignore_for_file: annotate_overrides

import 'package:faker_x/src/base/base.dart';

import 'package:faker_x/src/locales/fa_ir/datasources/phone.dart' as phone_653;
import 'package:faker_x/src/locales/fa_ir/datasources/address.dart'
    as address_449;
import 'package:faker_x/src/locales/fa_ir/datasources/job.dart' as job_938;
import 'package:faker_x/src/locales/global/datasources/person.dart'
    as person_886;
import 'package:faker_x/src/locales/fa_ir/datasources/person.dart'
    as person_378;
import 'package:faker_x/src/locales/fa_ir/datasources/automotive.dart'
    as automotive_31;
import 'package:faker_x/src/locales/global/datasources/color.dart' as color_257;
import 'package:faker_x/src/locales/fa_ir/datasources/color.dart' as color_783;
import 'package:faker_x/src/locales/fa_ir/datasources/lorem.dart' as lorem_817;
import 'package:faker_x/src/locales/fa_ir/datasources/animal.dart'
    as animal_679;
import 'package:faker_x/src/locales/fa_ir/datasources/vehicle.dart'
    as vehicle_225;
import 'package:faker_x/src/locales/global/datasources/internet.dart'
    as internet_824;
import 'package:faker_x/src/locales/global/datasources/image.dart' as image_121;
import 'package:faker_x/src/locales/global/datasources/location.dart'
    as location_711;

class FaIrCollection extends FakeCollection {
  final FakerXLocale locale;

  FaIrCollection()
      : locale = Locales.fa_ir,
        super(
          locale: Locales.fa_ir,
          dataSources: [
            phone_653.phone_number,
            phone_653.international_phone_number,
            address_449.building_name,
            address_449.street_suffix,
            address_449.state,
            address_449.address,
            address_449.city_name,
            address_449.postcode,
            address_449.building_number,
            address_449.street_name,
            address_449.alley,
            address_449.street_prefix,
            job_938.job_title,
            person_886.last_name_en,
            person_886.first_name_en,
            person_378.first_name_male,
            person_378.full_name,
            person_378.first_name_female,
            person_378.last_name,
            person_378.first_name,
            automotive_31.license_plate,
            color_257.color_hex,
            color_783.color_name,
            lorem_817.sentence,
            lorem_817.word,
            animal_679.animal_name,
            vehicle_225.car,
            internet_824.http_url,
            internet_824.email,
            internet_824.https_url,
            internet_824.password,
            internet_824.safe_email,
            internet_824.ipv4,
            internet_824.domain_suffixes,
            internet_824.user_name,
            internet_824.uri,
            internet_824.disposable_email,
            internet_824.mac_address,
            internet_824.emoji,
            internet_824.email_from,
            internet_824.ipv6,
            internet_824.mail_provider,
            internet_824.domain_name,
            internet_824.disposable_mail_provider,
            internet_824.user_name_from,
            image_121.image,
            image_121.avatar_uri,
            location_711.geo_location,
          ],
        );

  FaIrAddress get address => FaIrAddress(locale);

  FaIrAutomotive get automotive => FaIrAutomotive(locale);

  FaIrColor get color => FaIrColor(locale);

  FaIrInternet get internet => FaIrInternet(locale);

  FaIrImage get image => FaIrImage(locale);

  FaIrLocation get location => FaIrLocation(locale);
}

class FaIrAddress extends Address {
  final FakerXLocale locale;

  FaIrAddress(this.locale) : super(locale);

  String get buildingName => provide(DataKeys.building_name, locale);

  String get streetSuffix => provide(DataKeys.street_suffix, locale);

  String get alley => provide(DataKeys.alley, locale);

  String get streetPrefix => provide(DataKeys.street_prefix, locale);
}

class FaIrAutomotive extends Automotive {
  final FakerXLocale locale;

  FaIrAutomotive(this.locale) : super(locale);

  String get licensePlate => provide(DataKeys.license_plate, locale);
}

class FaIrColor extends Color {
  final FakerXLocale locale;

  FaIrColor(this.locale) : super(locale);

  String get colorHex => provide(DataKeys.color_hex, locale);
}

class FaIrInternet extends Internet {
  final FakerXLocale locale;

  FaIrInternet(this.locale) : super(locale);

  String get httpUrl => provide(DataKeys.http_url, locale);

  String get httpsUrl => provide(DataKeys.https_url, locale);

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

  String get ipv4 => provide(DataKeys.ipv4, locale);

  String get userName => provide(DataKeys.user_name, locale);

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

  String get macAddress => provide(DataKeys.mac_address, locale);

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

  String get ipv6 => provide(DataKeys.ipv6, locale);

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

class FaIrImage extends Image {
  final FakerXLocale locale;

  FaIrImage(this.locale) : super(locale);

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

  String get avatarUri => provide(DataKeys.avatar_uri, locale);
}

class FaIrLocation extends Location {
  final FakerXLocale locale;

  FaIrLocation(this.locale) : super(locale);

  GeoLocation get geoLocation => provide(DataKeys.geo_location, locale);
}
