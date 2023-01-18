import 'package:fake_it/src/base/base.dart';

abstract class Extra {}

class EmptyExtra extends Extra {}

class Job {
  Job(this._locale);

  final FakeItLocale _locale;

  String get jobTitle => provide(DataKeys.job_titles, _locale);

  String get jobSuffix => provide(DataKeys.job_suffixes, _locale);

  String get jobPrefix => provide(DataKeys.job_prefixes, _locale);
}

class Lorem {
  const Lorem(this._locale);

  final FakeItLocale _locale;

  String get word => provide(DataKeys.words, _locale);

  String get sentence => provide(DataKeys.sentences, _locale);
}

class Person {
  const Person(this._locale);

  final FakeItLocale _locale;

  String get jobTitles => provide(DataKeys.job_titles, _locale);

  String get jobSuffixes => provide(DataKeys.job_suffixes, _locale);

  String get jobPrefixes => provide(DataKeys.job_prefixes, _locale);
}

class Address {
  const Address(this._locale);

  final FakeItLocale _locale;

  String get citySuffixes => provide(DataKeys.city_suffixes, _locale);

  String get cityPrefixes => provide(DataKeys.city_prefixes, _locale);

  String get cityNames => provide(DataKeys.city_names, _locale);

  String get streetSuffixes => provide(DataKeys.street_suffixes, _locale);

  String get states => provide(DataKeys.states, _locale);

  String get postcodeFormats => provide(DataKeys.postcode_formats, _locale);

  String get addresses => provide(DataKeys.addresses, _locale);

  String get neighborhoods => provide(DataKeys.neighborhoods, _locale);

  String get streetNames => provide(DataKeys.street_names, _locale);

  String get postcodes => provide(DataKeys.postcodes, _locale);

  String get streetAddresses => provide(DataKeys.street_addresses, _locale);

  String get statesAbbr => provide(DataKeys.states_abbr, _locale);

  String get buildingNumbers => provide(DataKeys.building_numbers, _locale);

  String get secondaryAddresses =>
      provide(DataKeys.secondary_addresses, _locale);
}
