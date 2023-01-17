// ignore_for_file: non_constant_identifier_names

import 'package:fake_it/src/collections/fake_collection.dart';
import 'package:fake_it/src/base/locale.dart';

import 'package:fake_it/src/locales/en_us/en_us.dart';
import 'package:fake_it/src/locales/fa_ir/fa_ir.dart';

class FakeIt {
  FakeIt._();

  static late final defaultInstance = FakeCollection(
    locale: Locales.en_us,
    dataSources: [
      en_us_words,
      en_us_sentences,
      en_us_job_titles,
      en_us_job_prefixes,
      en_us_job_suffixes,
    ],
  );

  static late final localized = _Localized();
}

class _Localized {
  late final en_us = FakeCollection(
    locale: Locales.en_us,
    dataSources: [
      en_us_words,
      en_us_sentences,
      en_us_job_titles,
      en_us_job_prefixes,
      en_us_job_suffixes,
    ],
  );

  late final fa_ir = FakeCollection(
    locale: Locales.fa_ir,
    dataSources: [
      fa_ir_words,
      fa_ir_sentences,
      fa_ir_job_titles,
      fa_ir_job_prefixes,
      fa_ir_job_suffixes,
    ],
  );
}
