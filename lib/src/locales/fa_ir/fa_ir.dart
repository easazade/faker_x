/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make
/// to this file will be removed when code generation takes effect.
///
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

// ignore_for_file: annotate_overrides

import 'package:faker_x/src/base/base.dart';

import 'package:faker_x/src/locales/fa_ir/datasources/address.dart'
    as address_449;
import 'package:faker_x/src/locales/fa_ir/datasources/animal.dart'
    as animal_679;
import 'package:faker_x/src/locales/fa_ir/datasources/vehicle.dart'
    as vehicle_225;
import 'package:faker_x/src/locales/global/datasources/color.dart' as color_257;
import 'package:faker_x/src/locales/fa_ir/datasources/color.dart' as color_783;
import 'package:faker_x/src/locales/global/datasources/person.dart'
    as person_886;
import 'package:faker_x/src/locales/fa_ir/datasources/person.dart'
    as person_378;
import 'package:faker_x/src/locales/fa_ir/datasources/phone.dart' as phone_653;
import 'package:faker_x/src/locales/fa_ir/datasources/job.dart' as job_938;
import 'package:faker_x/src/locales/fa_ir/datasources/automotive.dart'
    as automotive_31;
import 'package:faker_x/src/locales/fa_ir/datasources/lorem.dart' as lorem_817;
import 'package:faker_x/src/locales/global/datasources/image.dart' as image_121;
import 'package:faker_x/src/locales/global/datasources/internet.dart'
    as internet_824;
import 'package:faker_x/src/locales/global/datasources/location.dart'
    as location_711;

class FaIrCollection extends FakeCollection {
  FaIrCollection() : super(locale: Locales.fa_ir);

  FaIrAddress get address => FaIrAddress(locale);

  FaIrColor get color => FaIrColor(locale);

  FaIrAutomotive get automotive => FaIrAutomotive(locale);

  FaIrImage get image => FaIrImage(locale);

  FaIrInternet get internet => FaIrInternet(locale);

  FaIrLocation get location => FaIrLocation(locale);
}

class FaIrAddress extends Address {
  final FakerXLocale locale;

  FaIrAddress(this.locale) : super(locale);

  String get alley => provide(DataKeys.alley, locale);

  String get buildingName => provide(DataKeys.building_name, locale);

  String get streetPrefix => provide(DataKeys.street_prefix, locale);

  String get streetSuffix => provide(DataKeys.street_suffix, locale);
}

class FaIrColor extends Color {
  final FakerXLocale locale;

  FaIrColor(this.locale) : super(locale);

  String get colorHex => provide(DataKeys.color_hex, locale);
}

class FaIrAutomotive extends Automotive {
  final FakerXLocale locale;

  FaIrAutomotive(this.locale) : super(locale);

  String get licensePlate => provide(DataKeys.license_plate, locale);
}

class FaIrImage extends Image {
  final FakerXLocale locale;

  FaIrImage(this.locale) : super(locale);

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

class FaIrInternet extends Internet {
  final FakerXLocale locale;

  FaIrInternet(this.locale) : super(locale);

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

class FaIrLocation extends Location {
  final FakerXLocale locale;

  FaIrLocation(this.locale) : super(locale);

  GeoLocation get geoLocation => provide(DataKeys.geo_location, locale);
}
