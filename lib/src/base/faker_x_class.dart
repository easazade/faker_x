import 'package:faker_x/src/locales/fa_ir/fa_ir.dart';
import 'package:faker_x/src/locales/en_us/en_us.dart';

class FakerX {
  FakerX._();

  static late final defaultInstance = EnUsCollection();
  static late final localized = _Localized();
}

class _Localized {
  late final fa_ir = FaIrCollection();
  late final en_us = EnUsCollection();
}
