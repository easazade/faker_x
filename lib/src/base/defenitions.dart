import 'package:fake_it/src/base/base.dart';

abstract class Extra {}

class EmptyExtra extends Extra {}

class Job {
  Job(this._locale);

  final FakeItLocale _locale;

  String get jobTitle => provide(DataKeys.jobTitles, _locale);

  String get jobSuffix => provide(DataKeys.jobSuffixes, _locale);

  String get jobPrefix => provide(DataKeys.jobPrefixes, _locale);
}

class Lorem {
  const Lorem(this._locale);

  final FakeItLocale _locale;

  String get word => provide(DataKeys.words, _locale);

  String get sentence => provide(DataKeys.sentences, _locale);
}
