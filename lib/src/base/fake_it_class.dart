// ignore_for_file: non_constant_identifier_names

import 'package:fake_it/src/collections/fake_collection.dart';
import 'package:fake_it/src/base/locale.dart';

class FakeIt {
  FakeIt._();

  static late final defaultInstance = FakeCollection(kDefaultFakeItLocale);

  static late final localized = _Localized();
}

class _Localized {
  late final en_US = FakeCollection(FakeItLocale('en', 'US'));
  late final fa_IR = FakeCollection(FakeItLocale('fa', 'IR'));
}
