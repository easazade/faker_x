// ignore_for_file: annotate_overrides

import 'package:fake_it/src/base/base.dart';

import 'package:fake_it/src/locales/fa_ir/datasources/address.dart'
    as address_664;
import 'package:fake_it/src/locales/fa_ir/datasources/job.dart' as job_527;
import 'package:fake_it/src/locales/fa_ir/datasources/person.dart' as person_87;
import 'package:fake_it/src/locales/fa_ir/datasources/automotive.dart'
    as automotive_714;
import 'package:fake_it/src/locales/global/datasources/color.dart' as color_525;
import 'package:fake_it/src/locales/fa_ir/datasources/color.dart' as color_81;
import 'package:fake_it/src/locales/fa_ir/datasources/lorem.dart' as lorem_857;
import 'package:fake_it/src/locales/fa_ir/datasources/vehicle.dart'
    as vehicle_894;
import 'package:fake_it/src/locales/global/datasources/image.dart' as image_375;

class FaIrCollection extends FakeCollection {
  final FakeItLocale locale;

  FaIrCollection()
      : locale = Locales.fa_ir,
        super(
          locale: Locales.fa_ir,
          dataSources: [
            address_664.building_name,
            address_664.street_suffix,
            address_664.state,
            address_664.address,
            address_664.city_name,
            address_664.postcode,
            address_664.building_number,
            address_664.street_name,
            address_664.alley,
            address_664.street_prefix,
            job_527.job_suffix,
            job_527.job_title,
            job_527.job_prefix,
            person_87.first_name_male,
            person_87.full_name,
            person_87.first_name_female,
            person_87.last_name,
            person_87.first_name,
            automotive_714.license_plate,
            color_525.color_hex,
            color_81.color_name,
            lorem_857.sentence,
            lorem_857.word,
            vehicle_894.car,
            image_375.image,
          ],
        );

  FaIrAddress get address => FaIrAddress(locale);

  FaIrPerson get person => FaIrPerson(locale);

  FaIrAutomotive get automotive => FaIrAutomotive(locale);

  FaIrColor get color => FaIrColor(locale);

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

class FaIrAutomotive extends Automotive {
  final FakeItLocale locale;

  FaIrAutomotive(this.locale) : super(locale);

  String get licensePlate => provide(DataKeys.license_plate, locale);
}

class FaIrColor extends Color {
  final FakeItLocale locale;

  FaIrColor(this.locale) : super(locale);

  String get colorHex => provide(DataKeys.color_hex, locale);
}

class FaIrImage extends Image {
  final FakeItLocale locale;

  FaIrImage(this.locale) : super(locale);

  String image(image_375.ImageArgs args) =>
      provide(DataKeys.image, locale, args: args);
}
