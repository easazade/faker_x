import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/job.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/lorem.dart';

class FaIrCollection extends FakeCollection {
  FaIrCollection()
      : super(
          locale: Locales.fa_ir,
          dataSources: [
            words,
            sentences,
            job_titles,
          ],
        );

  @override
  FaIrExtra get extra => FaIrExtra(Locales.fa_ir);
}

class FaIrExtra extends Extra {
  FaIrExtra(this.locale);

  final FakeItLocale locale;

  String get something => provide(DataKeys.words, locale);
}
