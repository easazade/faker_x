// ignore_for_file: non_constant_identifier_names

import 'package:fake_it/src/locales/en_us/en_us.dart';
import 'package:fake_it/src/locales/fa_ir/fa_ir.dart';

class FakeIt {
  FakeIt._();

  static late final defaultInstance = EnUsCollection();

  static late final localized = _Localized();
}

class _Localized {
  late final en_us = EnUsCollection();

  late final fa_ir = FaIrCollection();
}
