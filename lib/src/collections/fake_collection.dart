import 'package:fake_it/src/collections/defenitions/lorem.dart';
import 'package:fake_it/src/locale.dart';

class FakeCollection {
  FakeCollection(this.locale) : lorem = Lorem(locale);

  final FakeItLocale locale;

  final Lorem lorem;
}
