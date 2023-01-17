import 'package:fake_it/src/base/data_list.dart';
import 'package:fake_it/src/base/keys.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/utils.dart';
import 'package:fake_it/src/providers/jobs/jobs_fa.dart' as job_fa;
import 'package:fake_it/src/providers/jobs/jobs_en.dart' as job_en;

import 'package:fake_it/src/providers/lorem/lorem_en.dart' as lorem_en;
import 'package:fake_it/src/providers/lorem/lorem_fa.dart' as lorem_fa;

String provide(String key, FakeItLocale locale) {
  final localizedDataListMap = _localizedProvidersMap[locale];
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

final Map<FakeItLocale, Map<String, DataList>> _localizedProvidersMap = {
  FakeItLocale('en', 'US'): {
    Keys.words: lorem_en.words,
    Keys.sentences: lorem_en.sentences,
    Keys.jobTitles: job_en.jobTitles,
    Keys.jobSuffixes: job_en.jobSuffixes,
    Keys.jobPrefixes: job_en.jobPrefixes,
  },
  FakeItLocale('fa', 'IR'): {
    Keys.words: lorem_fa.words,
    Keys.sentences: lorem_fa.sentences,
    Keys.jobTitles: job_fa.jobTitles,
    Keys.jobSuffixes: job_en.jobSuffixes,
    Keys.jobPrefixes: job_en.jobPrefixes,
  },
};

final Map<String, DataList> _providersMap = {
  // Keys.numbers: DataList(values: ['1','2','3','4','5','6','7','8','9']),
};
