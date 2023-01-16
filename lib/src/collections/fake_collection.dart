import 'package:fake_it/src/collections/defenitions/job.dart';
import 'package:fake_it/src/collections/defenitions/lorem.dart';
import 'package:fake_it/src/base/locale.dart';

class FakeCollection {
  FakeCollection(this._locale)
      : lorem = Lorem(_locale),
        job = Job(_locale);

  final FakeItLocale _locale;

  final Lorem lorem;
  final Job job;
}
