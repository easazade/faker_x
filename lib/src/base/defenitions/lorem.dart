import 'package:fake_it/src/base/base.dart';

class Lorem {
  const Lorem(this._locale);

  final FakeItLocale _locale;

  String get word => provide(Keys.words, _locale);

  String get sentence => provide(Keys.sentences, _locale);
}
