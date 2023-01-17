import 'package:fake_it/src/base/keys.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider_map.dart';

class Job {
  Job(this._locale);

  final FakeItLocale _locale;

  String get jobTitle => provide(Keys.jobTitles, _locale);

  String get jobSuffix => provide(Keys.jobSuffixes, _locale);

  String get jobPrefix => provide(Keys.jobPrefixes, _locale);
}
