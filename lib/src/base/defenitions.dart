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
