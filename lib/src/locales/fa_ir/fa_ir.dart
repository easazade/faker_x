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
            words,
            sentences,
            job_titles,
          ],
        );

  @override
  FaIrExtra get extra => FaIrExtra(Locales.fa_ir);
}

//  city_names ,
//  street_names ,
//  street_suffixes ,
//  street_prefixes ,
//  states ,
//  postcodes ,
//  building_names ,
//  addresses ,
//  alleys ,

class FaIrExtra extends Extra {
  FaIrExtra(this.locale);

  final FakeItLocale locale;

  String get something => provide(DataKeys.words, locale);
}
