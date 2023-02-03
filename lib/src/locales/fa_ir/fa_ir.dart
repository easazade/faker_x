import 'package:fake_it/src/base/base.dart';

import 'package:fake_it/src/locales/fa_ir/datasources/address.dart' as address1;
import 'package:fake_it/src/locales/fa_ir/datasources/job.dart' as job1;
import 'package:fake_it/src/locales/fa_ir/datasources/person.dart' as person1;
import 'package:fake_it/src/locales/fa_ir/datasources/lorem.dart' as lorem1;
import 'package:fake_it/src/locales/global/datasources/image.dart' as image1;

class FaIrCollection extends FakeCollection {
  final FakeItLocale locale;

  FaIrCollection()
      : locale = Locales.fa_ir,
        super(
          locale: Locales.fa_ir,
          dataSources: [
            address1.building_name,
            address1.street_suffix,
            address1.state,
            address1.address,
            address1.city_name,
            address1.postcode,
            address1.building_number,
            address1.street_name,
            address1.alley,
            address1.street_prefix,
            job1.job_suffix,
            job1.job_title,
            job1.job_prefix,
            person1.first_name_male,
            person1.full_name,
            person1.first_name_female,
            person1.last_name,
            person1.first_name,
            lorem1.sentence,
            lorem1.word,
            image1.image,
          ],
        );

  @override
  FaIrAddress get address => FaIrAddress(locale);

  @override
  FaIrPerson get person => FaIrPerson(locale);

  @override
  FaIrImage get image => FaIrImage(locale);
}

class FaIrAddress extends Address {
  final FakeItLocale locale;

  FaIrAddress(this.locale) : super(locale);

  String get buildingName => provide(DataKeys.building_name, locale);
  String get streetSuffix => provide(DataKeys.street_suffix, locale);
  String get alley => provide(DataKeys.alley, locale);
  String get streetPrefix => provide(DataKeys.street_prefix, locale);
}

class FaIrPerson extends Person {
  final FakeItLocale locale;

  FaIrPerson(this.locale) : super(locale);

  String get firstNameMale => provide(DataKeys.first_name_male, locale);
  String get firstNameFemale => provide(DataKeys.first_name_female, locale);
}

class FaIrImage extends Image {
  final FakeItLocale locale;

  FaIrImage(this.locale) : super(locale);

  String image(image1.ImageArgs args) =>
      provide(DataKeys.image, locale, args: args);
}
