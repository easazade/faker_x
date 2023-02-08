// ignore_for_file: annotate_overrides

import 'package:fake_it/src/base/base.dart';

import 'package:fake_it/src/locales/fa_ir/datasources/address.dart'
    as address_664;
import 'package:fake_it/src/locales/fa_ir/datasources/job.dart' as job_527;
import 'package:fake_it/src/locales/global/datasources/person.dart'
    as person_534;
import 'package:fake_it/src/locales/fa_ir/datasources/person.dart' as person_87;
import 'package:fake_it/src/locales/fa_ir/datasources/automotive.dart'
    as automotive_714;
import 'package:fake_it/src/locales/global/datasources/color.dart' as color_525;
import 'package:fake_it/src/locales/fa_ir/datasources/color.dart' as color_81;
import 'package:fake_it/src/locales/fa_ir/datasources/lorem.dart' as lorem_857;
import 'package:fake_it/src/locales/fa_ir/datasources/vehicle.dart'
    as vehicle_894;
import 'package:fake_it/src/locales/global/datasources/internet.dart'
    as internet_555;
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
            person_534.last_name_en,
            person_534.first_name_en,
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
            internet_555.user_name,
            internet_555.email,
            internet_555.user_name_from,
            image_375.image,
          ],
        );

  FaIrAddress get address => FaIrAddress(locale);

  FaIrAutomotive get automotive => FaIrAutomotive(locale);

  FaIrColor get color => FaIrColor(locale);

  FaIrInternet get internet => FaIrInternet(locale);

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

class FaIrInternet extends Internet {
  final FakeItLocale locale;

  FaIrInternet(this.locale) : super(locale);

  String get userName => provide(DataKeys.user_name, locale);
  String email(internet_555.EmailArgs args) =>
      provide(DataKeys.email, locale, args: args);
  String userNameFrom(internet_555.UsernameArgs args) =>
      provide(DataKeys.user_name_from, locale, args: args);
}

class FaIrImage extends Image {
  final FakeItLocale locale;

  FaIrImage(this.locale) : super(locale);

  String image(image_375.ImageArgs args) =>
      provide(DataKeys.image, locale, args: args);
}
