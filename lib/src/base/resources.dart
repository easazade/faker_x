// ignore_for_file: unused_field

import 'package:fake_it/src/base/base.dart';

abstract class Extra {}

class EmptyExtra extends Extra {}

class Job {
  Job(this._locale);

  final FakeItLocale _locale;

  String get jobTitle => provide(DataKeys.job_title, _locale);

  String get jobSuffix => provide(DataKeys.job_suffix, _locale);

  String get jobPrefix => provide(DataKeys.job_prefix, _locale);
}

class Lorem {
  const Lorem(this._locale);

  final FakeItLocale _locale;

  String get word => provide(DataKeys.word, _locale);

  String get sentence => provide(DataKeys.sentence, _locale);
}

class Person {
  const Person(this._locale);

  final FakeItLocale _locale;

  String get firstName => provide(DataKeys.first_name, _locale);

  String get lastName => provide(DataKeys.last_name, _locale);

  String get fullName => provide(DataKeys.full_name, _locale);
}

class Address {
  const Address(this._locale);

  final FakeItLocale _locale;

  String get cityName => provide(DataKeys.city_name, _locale);

  String get state => provide(DataKeys.state, _locale);

  String get address => provide(DataKeys.address, _locale);

  String get streetName => provide(DataKeys.street_name, _locale);

  String get postcode => provide(DataKeys.postcode, _locale);

  String get buildingNumber => provide(DataKeys.building_number, _locale);
}

class Image {
  const Image(this._locale);

  final FakeItLocale _locale;
}
