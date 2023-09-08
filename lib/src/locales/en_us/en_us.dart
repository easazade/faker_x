/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make 
/// to this file will be removed when code generation takes effect.
/// 
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

// ignore_for_file: annotate_overrides

import 'package:faker_x/src/base/base.dart';

import 'package:faker_x/src/locales/en_us/datasources/address.dart' as address_237;
import 'package:faker_x/src/locales/en_us/datasources/animal.dart' as animal_354;
import 'package:faker_x/src/locales/en_us/datasources/vehicle.dart' as vehicle_661;
import 'package:faker_x/src/locales/global/datasources/color.dart' as color_257;
import 'package:faker_x/src/locales/en_us/datasources/color.dart' as color_180;
import 'package:faker_x/src/locales/global/datasources/person.dart' as person_886;
import 'package:faker_x/src/locales/en_us/datasources/person.dart' as person_873;
import 'package:faker_x/src/locales/en_us/datasources/phone.dart' as phone_59;
import 'package:faker_x/src/locales/en_us/datasources/job.dart' as job_914;
import 'package:faker_x/src/locales/en_us/datasources/automotive.dart' as automotive_744;
import 'package:faker_x/src/locales/en_us/datasources/lorem.dart' as lorem_915;
import 'package:faker_x/src/locales/global/datasources/image.dart' as image_121;
import 'package:faker_x/src/locales/global/datasources/internet.dart' as internet_824;
import 'package:faker_x/src/locales/global/datasources/location.dart' as location_711;
class EnUsCollection extends FakeCollection {
final FakerXLocale locale;

EnUsCollection()
: locale = Locales.en_us,
super(
locale: Locales.en_us,
dataSources: [
address_237.address,
address_237.building_number,
address_237.city_name,
address_237.city_prefix,
address_237.city_suffix,
address_237.neighborhood,
address_237.postcode,
address_237.postcode_format,
address_237.secondary_address,
address_237.state,
address_237.state_abbr,
address_237.street_address,
address_237.street_name,
address_237.street_suffix,
animal_354.animal_name,
vehicle_661.car,
color_257.color_hex,
color_180.color_name,
person_886.first_name_en,
person_886.last_name_en,
person_873.first_name,
person_873.first_name_female,
person_873.first_name_male,
person_873.full_name,
person_873.last_name,
phone_59.international_phone_number,
phone_59.phone_number,
job_914.job_prefix,
job_914.job_suffix,
job_914.job_title,
automotive_744.license_plate,
lorem_915.sentence,
lorem_915.word,
image_121.avatar_uri,
image_121.image,
internet_824.disposable_email,
internet_824.disposable_mail_provider,
internet_824.domain_name,
internet_824.domain_suffixes,
internet_824.email,
internet_824.email_from,
internet_824.emoji,
internet_824.http_url,
internet_824.https_url,
internet_824.ipv4,
internet_824.ipv6,
internet_824.mac_address,
internet_824.mail_provider,
internet_824.password,
internet_824.safe_email,
internet_824.uri,
internet_824.user_name,
internet_824.user_name_from,
location_711.geo_location,
]
,);

EnUsAddress get address => EnUsAddress(locale);

EnUsColor get color => EnUsColor(locale);

EnUsJob get job => EnUsJob(locale);

EnUsImage get image => EnUsImage(locale);

EnUsInternet get internet => EnUsInternet(locale);

EnUsLocation get location => EnUsLocation(locale);

}
class EnUsAddress extends Address {
final FakerXLocale locale;

EnUsAddress(this.locale) : super(locale);

String get cityPrefix => provide(DataKeys.city_prefix,locale);

String get citySuffix => provide(DataKeys.city_suffix,locale);

String get neighborhood => provide(DataKeys.neighborhood,locale);

String get postcodeFormat => provide(DataKeys.postcode_format,locale);

String get secondaryAddress => provide(DataKeys.secondary_address,locale);

String get stateAbbr => provide(DataKeys.state_abbr,locale);

String get streetAddress => provide(DataKeys.street_address,locale);

String get streetSuffix => provide(DataKeys.street_suffix,locale);

}


class EnUsColor extends Color {
final FakerXLocale locale;

EnUsColor(this.locale) : super(locale);

String get colorHex => provide(DataKeys.color_hex,locale);

}


class EnUsJob extends Job {
final FakerXLocale locale;

EnUsJob(this.locale) : super(locale);

String get jobPrefix => provide(DataKeys.job_prefix,locale);

String get jobSuffix => provide(DataKeys.job_suffix,locale);

}


class EnUsImage extends Image {
final FakerXLocale locale;

EnUsImage(this.locale) : super(locale);

String get avatarUri => provide(DataKeys.avatar_uri,locale);

String image({ required  int width,  required  int height,  required  List<String> keywords, }) => provide(DataKeys.image, locale, args: image_121.ImageArgs(width:width, height:height, keywords:keywords, ), );

}


class EnUsInternet extends Internet {
final FakerXLocale locale;

EnUsInternet(this.locale) : super(locale);

String emailFrom({ String? firstName,  String? lastName,  String? provider, }) => provide(DataKeys.email_from, locale, args: internet_824.EmailArgs(firstName:firstName, lastName:lastName, provider:provider, ), );

String get httpUrl => provide(DataKeys.http_url,locale);

String get httpsUrl => provide(DataKeys.https_url,locale);

String get ipv4 => provide(DataKeys.ipv4,locale);

String get ipv6 => provide(DataKeys.ipv6,locale);

String get macAddress => provide(DataKeys.mac_address,locale);

String password({ int length= 10, bool onlyNumeric= false,}) => provide(DataKeys.password, locale, args: internet_824.PasswordArgs(length:length, onlyNumeric:onlyNumeric, ), );

String uri({ required  String protocol, }) => provide(DataKeys.uri, locale, args: internet_824.UriArgs(protocol:protocol, ), );

String get userName => provide(DataKeys.user_name,locale);

String userNameFrom({ String? firstName,  String? lastName, }) => provide(DataKeys.user_name_from, locale, args: internet_824.UsernameArgs(firstName:firstName, lastName:lastName, ), );

}


class EnUsLocation extends Location {
final FakerXLocale locale;

EnUsLocation(this.locale) : super(locale);

GeoLocation get geoLocation => provide(DataKeys.geo_location,locale);

}


