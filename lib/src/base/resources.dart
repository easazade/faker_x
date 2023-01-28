import 'package:fake_it/src/base/base.dart';

abstract class Extra {}

class EmptyExtra extends Extra {}

class Job {
  Job(this._locale);

  final FakeItLocale _locale;

  String get jobTitles => provide(DataKeys.job_titles, _locale);

  String get jobSuffixes => provide(DataKeys.job_suffixes, _locale);

  String get jobPrefixes => provide(DataKeys.job_prefixes, _locale);
}

class Lorem {
  const Lorem(this._locale);

  final FakeItLocale _locale;

  String get words => provide(DataKeys.words, _locale);

  String get sentences => provide(DataKeys.sentences, _locale);
}

class Person {
  const Person(this._locale);

  final FakeItLocale _locale;

  String get firstNames => provide(DataKeys.first_names, _locale);

  String get lastNames => provide(DataKeys.last_names, _locale);

  String get fullNames => provide(DataKeys.full_names, _locale);
}

class Address {
  const Address(this._locale);

  final FakeItLocale _locale;

  String get citySuffixes => provide(DataKeys.city_suffixes, _locale);

  String get cityPrefixes => provide(DataKeys.city_prefixes, _locale);

  String get cityNames => provide(DataKeys.city_names, _locale);

  String get streetSuffixes => provide(DataKeys.street_suffixes, _locale);

  String get states => provide(DataKeys.states, _locale);

  String get addresses => provide(DataKeys.addresses, _locale);

  String get neighborhoods => provide(DataKeys.neighborhoods, _locale);

  String get streetNames => provide(DataKeys.street_names, _locale);

  String get postcodes => provide(DataKeys.postcodes, _locale);

  String get streetAddresses => provide(DataKeys.street_addresses, _locale);

  String get buildingNumbers => provide(DataKeys.building_numbers, _locale);
}
