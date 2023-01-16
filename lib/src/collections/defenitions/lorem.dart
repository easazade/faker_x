import 'package:fake_it/src/base/keys.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider_map.dart';

class Lorem {
  const Lorem(this._locale);

  final FakeItLocale _locale;

  String get word => provide(Key.words, _locale);

  String get sentence => provide(Key.sentences, _locale);
}
