import 'package:fake_it/src/collections/fake_collection.dart';
import 'package:fake_it/src/locale.dart';

class FakeIt {
  FakeIt._();

  static final defaultInstance = FakeCollection(kDefaultFakeItLocale);
}
