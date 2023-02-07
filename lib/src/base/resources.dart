// ignore_for_file: unused_field

import 'package:fake_it/src/base/base.dart';

@BaseResource(isRequired: true)
class Job {
  Job(this._locale);

  final FakeItLocale _locale;

  String get jobTitle => provide(DataKeys.job_title, _locale);

  String get jobSuffix => provide(DataKeys.job_suffix, _locale);

  String get jobPrefix => provide(DataKeys.job_prefix, _locale);
}

@BaseResource(isRequired: true)
class Lorem {
  Lorem(this._locale);

  final FakeItLocale _locale;

  String get word => provide(DataKeys.word, _locale);

  String get sentence => provide(DataKeys.sentence, _locale);
}

@BaseResource(isRequired: true)
class Person {
  Person(this._locale);

  final FakeItLocale _locale;

  String get firstName => provide(DataKeys.first_name, _locale);

  String get lastName => provide(DataKeys.last_name, _locale);

  String get fullName => provide(DataKeys.full_name, _locale);
}

@BaseResource(isRequired: true)
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
}

@BaseResource(isRequired: true)
class Automotive {
  Automotive(this._locale);

  final FakeItLocale _locale;

  String get licensePlate => provide(DataKeys.license_plate, _locale);
}

@BaseResource(isRequired: true)
class Vehicle {
  Vehicle(this._locale);

  final FakeItLocale _locale;

  String get car => provide(DataKeys.car, _locale);
}

@BaseResource(isRequired: false)
class Extra {
  Extra(this._locale);

  final FakeItLocale _locale;
}
