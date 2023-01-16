import 'package:fake_it/src/base/data_list.dart';
import 'package:fake_it/src/base/keys.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/utils.dart';
import 'package:fake_it/src/providers/jobs/jobs_fa.dart' as job_fa;
import 'package:fake_it/src/providers/jobs/jobs_en.dart' as job_en;

import 'package:fake_it/src/providers/lorem/lorem_en.dart' as lorem_en;
import 'package:fake_it/src/providers/lorem/lorem_fa.dart' as lorem_fa;

String provide(String key, FakeItLocale locale) {
  final localizedDataListMap = _providersMap[locale];
  if (localizedDataListMap == null) {
    throw Exception('There is no localized values available for $locale');
  }

  final dataList = localizedDataListMap[key];
  if (dataList == null) {
    throw Exception('There are no $key values available for $locale');
  }

  //TODO: we need to make values with formats and return them
  return dataList.values.randomItem;
}

final Map<FakeItLocale, Map<String, DataList>> _providersMap = {
  FakeItLocale('en', 'US'): {
    Key.words: lorem_en.words,
    Key.sentences: lorem_en.sentences,
    Key.jobTitles: job_en.jobTitles,
    Key.jobSuffixes: job_en.jobSuffixes,
    Key.jobPrefixes: job_en.jobPrefixes,
  },
  FakeItLocale('fa', 'IR'): {
    Key.words: lorem_fa.words,
    Key.sentences: lorem_fa.sentences,
    Key.jobTitles: job_fa.jobTitles,
    Key.jobSuffixes: job_en.jobSuffixes,
    Key.jobPrefixes: job_en.jobPrefixes,
  },
};

final Map<String, DataList> _unicProviders = {
  //TODO: remove fake entry
  'unic_key_for_some_values': DataList(values: []),
};
