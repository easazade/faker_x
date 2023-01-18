import 'package:fake_it/src/base/defenitions.dart';
import 'package:fake_it/src/base/fake_collection.dart';
import 'package:fake_it/src/base/keys.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/job.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/lorem.dart';

export 'datasources/address.dart';
export 'datasources/car.dart';
export 'datasources/color.dart';
export 'datasources/country.dart';
export 'datasources/currency.dart';
export 'datasources/job.dart';
export 'datasources/lorem.dart';

class FaIrCollection extends FakeCollection {
  FaIrCollection()
      : super(
          locale: Locales.fa_ir,
          dataSources: [
            fa_ir_words,
            fa_ir_sentences,
            fa_ir_job_titles,
            fa_ir_job_prefixes,
            fa_ir_job_suffixes,
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
