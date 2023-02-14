// ignore_for_file: unused_field

import 'package:fake_it/src/base/base.dart';

@BaseResource()
class Job {
  Job(this._locale);

  final FakeItLocale _locale;

  String get jobTitle => provide(DataKeys.job_title, _locale);
  String get jobSuffix => provide(DataKeys.job_suffix, _locale);
  String get jobPrefix => provide(DataKeys.job_prefix, _locale);
}

@BaseResource()
class Lorem {
  Lorem(this._locale);

  final FakeItLocale _locale;

  String get word => provide(DataKeys.word, _locale);
  String get sentence => provide(DataKeys.sentence, _locale);
}

@BaseResource()
class Person {
  Person(this._locale);

  final FakeItLocale _locale;

  String get firstName => provide(DataKeys.first_name, _locale);
  String get firstNameFemale => provide(DataKeys.first_name_female, _locale);
  String get firstNameMale => provide(DataKeys.first_name_male, _locale);
  String get firstNameEn => provide(DataKeys.first_name_en, _locale);
  String get lastName => provide(DataKeys.last_name, _locale);
  String get lastNameEn => provide(DataKeys.last_name_en, _locale);
  String get fullName => provide(DataKeys.full_name, _locale);
}

@BaseResource()
class Address {
  Address(this._locale);

  final FakeItLocale _locale;

  String get cityName => provide(DataKeys.city_name, _locale);
  String get state => provide(DataKeys.state, _locale);
  String get address => provide(DataKeys.address, _locale);
  String get streetName => provide(DataKeys.street_name, _locale);
  String get postcode => provide(DataKeys.postcode, _locale);
  String get buildingNumber => provide(DataKeys.building_number, _locale);
}

@BaseResource(isRequired: false)
class Image {
  Image(this._locale);

  final FakeItLocale _locale;

  String get avatarUri => provide(DataKeys.avatar_uri, _locale);
}

@BaseResource()
class Automotive {
  Automotive(this._locale);

  final FakeItLocale _locale;

  String get licensePlate => provide(DataKeys.license_plate, _locale);
}

@BaseResource()
class Vehicle {
  Vehicle(this._locale);

  final FakeItLocale _locale;

  String get car => provide(DataKeys.car, _locale);
}

@BaseResource()
class Color {
  Color(this._locale);

  final FakeItLocale _locale;

  String get colorName => provide(DataKeys.color_name, _locale);
  String get colorHex => provide(DataKeys.color_hex, _locale);
}

@BaseResource()
class Internet {
  Internet(this._locale);

  final FakeItLocale _locale;

  String get email => provide(DataKeys.email, _locale);
  String get mailProvider => provide(DataKeys.mail_provider, _locale);
  String get disposableMailProvider =>
      provide(DataKeys.disposable_mail_provider, _locale);
  String get disposableEmail => provide(DataKeys.disposable_email, _locale);
  String get safeEmail => provide(DataKeys.safe_email, _locale);
  String get domainName => provide(DataKeys.domain_name, _locale);
  String get domainSuffixes => provide(DataKeys.domain_suffixes, _locale);
  String get httpUrl => provide(DataKeys.http_url, _locale);
  String get httpsUrl => provide(DataKeys.https_url, _locale);
  String get ipv4 => provide(DataKeys.ipv4, _locale);
  String get ipv6 => provide(DataKeys.ipv6, _locale);
  String get macAddress => provide(DataKeys.mac_address, _locale);
  String get userName => provide(DataKeys.user_name, _locale);
  String get emoji => provide(DataKeys.emoji, _locale);
  // String get userAgent => provide(DataKeys.user_agent, _locale);
}

@BaseResource()
class Animal {
  Animal(this._locale);

  final FakeItLocale _locale;

  String get animalName => provide(DataKeys.animal_name, _locale);
}

@BaseResource()
class Location {
  Location(this._locale);

  final FakeItLocale _locale;

  GeoLocation get geoLocation => provide(DataKeys.geo_location, _locale);
}

@BaseResource()
class Phone {
  Phone(this._locale);

  final FakeItLocale _locale;

  String get phoneNumber => provide(DataKeys.phone_number, _locale);

  String get internationalPhoneNumber =>
      provide(DataKeys.international_phone_number, _locale);
}

@BaseResource(isRequired: false)
class Extra {
  Extra(this._locale);

  final FakeItLocale _locale;
}

class GeoLocation {
  final double latitude;
  final double longitude;

  GeoLocation(this.latitude, this.longitude);

  @override
  String toString() => '$latitude - $longitude';
}
