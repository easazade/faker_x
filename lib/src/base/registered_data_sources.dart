/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make
/// to this file will be removed when code generation takes effect.
///
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

import 'package:faker_x/src/base/data_source.dart';
import 'package:faker_x/src/base/keys.dart';
import 'package:faker_x/src/base/locale.dart';
import 'package:faker_x/src/locales/en_us/datasources/address.dart'
    as address_237;
import 'package:faker_x/src/locales/en_us/datasources/animal.dart'
    as animal_354;
import 'package:faker_x/src/locales/en_us/datasources/vehicle.dart'
    as vehicle_661;
import 'package:faker_x/src/locales/global/datasources/color.dart' as color_257;
import 'package:faker_x/src/locales/en_us/datasources/color.dart' as color_180;
import 'package:faker_x/src/locales/global/datasources/person.dart'
    as person_886;
import 'package:faker_x/src/locales/en_us/datasources/person.dart'
    as person_873;
import 'package:faker_x/src/locales/en_us/datasources/phone.dart' as phone_59;
import 'package:faker_x/src/locales/en_us/datasources/job.dart' as job_914;
import 'package:faker_x/src/locales/en_us/datasources/automotive.dart'
    as automotive_744;
import 'package:faker_x/src/locales/global/datasources/lorem.dart' as lorem_536;
import 'package:faker_x/src/locales/en_us/datasources/lorem.dart' as lorem_915;
import 'package:faker_x/src/locales/global/datasources/image.dart' as image_121;
import 'package:faker_x/src/locales/global/datasources/internet.dart'
    as internet_824;
import 'package:faker_x/src/locales/global/datasources/location.dart'
    as location_711;
import 'package:faker_x/src/locales/fa_ir/datasources/address.dart'
    as address_449;
import 'package:faker_x/src/locales/fa_ir/datasources/animal.dart'
    as animal_679;
import 'package:faker_x/src/locales/fa_ir/datasources/vehicle.dart'
    as vehicle_225;
import 'package:faker_x/src/locales/fa_ir/datasources/color.dart' as color_783;
import 'package:faker_x/src/locales/fa_ir/datasources/person.dart'
    as person_378;
import 'package:faker_x/src/locales/fa_ir/datasources/phone.dart' as phone_653;
import 'package:faker_x/src/locales/fa_ir/datasources/job.dart' as job_938;
import 'package:faker_x/src/locales/fa_ir/datasources/automotive.dart'
    as automotive_31;
import 'package:faker_x/src/locales/fa_ir/datasources/lorem.dart' as lorem_817;

final Map<FakerXLocale, Map<String, DataSource>> registeredDataSources = {
  Locales.en_us: {
    // en_us.address has 14 DataSources
    DataKeys.address: address_237.address.copyWith(locale: Locales.en_us),
    DataKeys.building_number:
        address_237.building_number.copyWith(locale: Locales.en_us),
    DataKeys.city_name: address_237.city_name.copyWith(locale: Locales.en_us),
    DataKeys.city_prefix:
        address_237.city_prefix.copyWith(locale: Locales.en_us),
    DataKeys.city_suffix:
        address_237.city_suffix.copyWith(locale: Locales.en_us),
    DataKeys.neighborhood:
        address_237.neighborhood.copyWith(locale: Locales.en_us),
    DataKeys.postcode: address_237.postcode.copyWith(locale: Locales.en_us),
    DataKeys.postcode_format:
        address_237.postcode_format.copyWith(locale: Locales.en_us),
    DataKeys.secondary_address:
        address_237.secondary_address.copyWith(locale: Locales.en_us),
    DataKeys.state: address_237.state.copyWith(locale: Locales.en_us),
    DataKeys.state_abbr: address_237.state_abbr.copyWith(locale: Locales.en_us),
    DataKeys.street_address:
        address_237.street_address.copyWith(locale: Locales.en_us),
    DataKeys.street_name:
        address_237.street_name.copyWith(locale: Locales.en_us),
    DataKeys.street_suffix:
        address_237.street_suffix.copyWith(locale: Locales.en_us),
    // en_us.animal has 1 DataSources
    DataKeys.animal_name:
        animal_354.animal_name.copyWith(locale: Locales.en_us),
    // en_us.vehicle has 1 DataSources
    DataKeys.car: vehicle_661.car.copyWith(locale: Locales.en_us),
    // en_us.color has 2 DataSources
    DataKeys.color_hex: color_257.color_hex.copyWith(locale: Locales.en_us),
    DataKeys.color_name: color_180.color_name.copyWith(locale: Locales.en_us),
    // en_us.person has 7 DataSources
    DataKeys.first_name_en:
        person_886.first_name_en.copyWith(locale: Locales.en_us),
    DataKeys.last_name_en:
        person_886.last_name_en.copyWith(locale: Locales.en_us),
    DataKeys.first_name: person_873.first_name.copyWith(locale: Locales.en_us),
    DataKeys.first_name_female:
        person_873.first_name_female.copyWith(locale: Locales.en_us),
    DataKeys.first_name_male:
        person_873.first_name_male.copyWith(locale: Locales.en_us),
    DataKeys.full_name: person_873.full_name.copyWith(locale: Locales.en_us),
    DataKeys.last_name: person_873.last_name.copyWith(locale: Locales.en_us),
    // en_us.phone has 2 DataSources
    DataKeys.international_phone_number:
        phone_59.international_phone_number.copyWith(locale: Locales.en_us),
    DataKeys.phone_number:
        phone_59.phone_number.copyWith(locale: Locales.en_us),
    // en_us.job has 3 DataSources
    DataKeys.job_prefix: job_914.job_prefix.copyWith(locale: Locales.en_us),
    DataKeys.job_suffix: job_914.job_suffix.copyWith(locale: Locales.en_us),
    DataKeys.job_title: job_914.job_title.copyWith(locale: Locales.en_us),
    // en_us.automotive has 1 DataSources
    DataKeys.license_plate:
        automotive_744.license_plate.copyWith(locale: Locales.en_us),
    // en_us.lorem has 3 DataSources
    DataKeys.paragraph: lorem_536.paragraph.copyWith(locale: Locales.en_us),
    DataKeys.sentence: lorem_915.sentence.copyWith(locale: Locales.en_us),
    DataKeys.word: lorem_915.word.copyWith(locale: Locales.en_us),
    // en_us.image has 2 DataSources
    DataKeys.avatar_uri: image_121.avatar_uri.copyWith(locale: Locales.en_us),
    DataKeys.image: image_121.image.copyWith(locale: Locales.en_us),
    // en_us.internet has 18 DataSources
    DataKeys.disposable_email:
        internet_824.disposable_email.copyWith(locale: Locales.en_us),
    DataKeys.disposable_mail_provider:
        internet_824.disposable_mail_provider.copyWith(locale: Locales.en_us),
    DataKeys.domain_name:
        internet_824.domain_name.copyWith(locale: Locales.en_us),
    DataKeys.domain_suffixes:
        internet_824.domain_suffixes.copyWith(locale: Locales.en_us),
    DataKeys.email: internet_824.email.copyWith(locale: Locales.en_us),
    DataKeys.email_from:
        internet_824.email_from.copyWith(locale: Locales.en_us),
    DataKeys.emoji: internet_824.emoji.copyWith(locale: Locales.en_us),
    DataKeys.http_url: internet_824.http_url.copyWith(locale: Locales.en_us),
    DataKeys.https_url: internet_824.https_url.copyWith(locale: Locales.en_us),
    DataKeys.ipv4: internet_824.ipv4.copyWith(locale: Locales.en_us),
    DataKeys.ipv6: internet_824.ipv6.copyWith(locale: Locales.en_us),
    DataKeys.mac_address:
        internet_824.mac_address.copyWith(locale: Locales.en_us),
    DataKeys.mail_provider:
        internet_824.mail_provider.copyWith(locale: Locales.en_us),
    DataKeys.password: internet_824.password.copyWith(locale: Locales.en_us),
    DataKeys.safe_email:
        internet_824.safe_email.copyWith(locale: Locales.en_us),
    DataKeys.uri: internet_824.uri.copyWith(locale: Locales.en_us),
    DataKeys.user_name: internet_824.user_name.copyWith(locale: Locales.en_us),
    DataKeys.user_name_from:
        internet_824.user_name_from.copyWith(locale: Locales.en_us),
    // en_us.location has 1 DataSources
    DataKeys.geo_location:
        location_711.geo_location.copyWith(locale: Locales.en_us),
  },
  Locales.fa_ir: {
    // fa_ir.address has 10 DataSources
    DataKeys.address: address_449.address.copyWith(locale: Locales.fa_ir),
    DataKeys.alley: address_449.alley.copyWith(locale: Locales.fa_ir),
    DataKeys.building_name:
        address_449.building_name.copyWith(locale: Locales.fa_ir),
    DataKeys.building_number:
        address_449.building_number.copyWith(locale: Locales.fa_ir),
    DataKeys.city_name: address_449.city_name.copyWith(locale: Locales.fa_ir),
    DataKeys.postcode: address_449.postcode.copyWith(locale: Locales.fa_ir),
    DataKeys.state: address_449.state.copyWith(locale: Locales.fa_ir),
    DataKeys.street_name:
        address_449.street_name.copyWith(locale: Locales.fa_ir),
    DataKeys.street_prefix:
        address_449.street_prefix.copyWith(locale: Locales.fa_ir),
    DataKeys.street_suffix:
        address_449.street_suffix.copyWith(locale: Locales.fa_ir),
    // fa_ir.animal has 1 DataSources
    DataKeys.animal_name:
        animal_679.animal_name.copyWith(locale: Locales.fa_ir),
    // fa_ir.vehicle has 1 DataSources
    DataKeys.car: vehicle_225.car.copyWith(locale: Locales.fa_ir),
    // fa_ir.color has 2 DataSources
    DataKeys.color_hex: color_257.color_hex.copyWith(locale: Locales.fa_ir),
    DataKeys.color_name: color_783.color_name.copyWith(locale: Locales.fa_ir),
    // fa_ir.person has 7 DataSources
    DataKeys.first_name_en:
        person_886.first_name_en.copyWith(locale: Locales.fa_ir),
    DataKeys.last_name_en:
        person_886.last_name_en.copyWith(locale: Locales.fa_ir),
    DataKeys.first_name: person_378.first_name.copyWith(locale: Locales.fa_ir),
    DataKeys.first_name_female:
        person_378.first_name_female.copyWith(locale: Locales.fa_ir),
    DataKeys.first_name_male:
        person_378.first_name_male.copyWith(locale: Locales.fa_ir),
    DataKeys.full_name: person_378.full_name.copyWith(locale: Locales.fa_ir),
    DataKeys.last_name: person_378.last_name.copyWith(locale: Locales.fa_ir),
    // fa_ir.phone has 2 DataSources
    DataKeys.international_phone_number:
        phone_653.international_phone_number.copyWith(locale: Locales.fa_ir),
    DataKeys.phone_number:
        phone_653.phone_number.copyWith(locale: Locales.fa_ir),
    // fa_ir.job has 1 DataSources
    DataKeys.job_title: job_938.job_title.copyWith(locale: Locales.fa_ir),
    // fa_ir.automotive has 1 DataSources
    DataKeys.license_plate:
        automotive_31.license_plate.copyWith(locale: Locales.fa_ir),
    // fa_ir.lorem has 3 DataSources
    DataKeys.paragraph: lorem_536.paragraph.copyWith(locale: Locales.fa_ir),
    DataKeys.sentence: lorem_817.sentence.copyWith(locale: Locales.fa_ir),
    DataKeys.word: lorem_817.word.copyWith(locale: Locales.fa_ir),
    // fa_ir.image has 2 DataSources
    DataKeys.avatar_uri: image_121.avatar_uri.copyWith(locale: Locales.fa_ir),
    DataKeys.image: image_121.image.copyWith(locale: Locales.fa_ir),
    // fa_ir.internet has 18 DataSources
    DataKeys.disposable_email:
        internet_824.disposable_email.copyWith(locale: Locales.fa_ir),
    DataKeys.disposable_mail_provider:
        internet_824.disposable_mail_provider.copyWith(locale: Locales.fa_ir),
    DataKeys.domain_name:
        internet_824.domain_name.copyWith(locale: Locales.fa_ir),
    DataKeys.domain_suffixes:
        internet_824.domain_suffixes.copyWith(locale: Locales.fa_ir),
    DataKeys.email: internet_824.email.copyWith(locale: Locales.fa_ir),
    DataKeys.email_from:
        internet_824.email_from.copyWith(locale: Locales.fa_ir),
    DataKeys.emoji: internet_824.emoji.copyWith(locale: Locales.fa_ir),
    DataKeys.http_url: internet_824.http_url.copyWith(locale: Locales.fa_ir),
    DataKeys.https_url: internet_824.https_url.copyWith(locale: Locales.fa_ir),
    DataKeys.ipv4: internet_824.ipv4.copyWith(locale: Locales.fa_ir),
    DataKeys.ipv6: internet_824.ipv6.copyWith(locale: Locales.fa_ir),
    DataKeys.mac_address:
        internet_824.mac_address.copyWith(locale: Locales.fa_ir),
    DataKeys.mail_provider:
        internet_824.mail_provider.copyWith(locale: Locales.fa_ir),
    DataKeys.password: internet_824.password.copyWith(locale: Locales.fa_ir),
    DataKeys.safe_email:
        internet_824.safe_email.copyWith(locale: Locales.fa_ir),
    DataKeys.uri: internet_824.uri.copyWith(locale: Locales.fa_ir),
    DataKeys.user_name: internet_824.user_name.copyWith(locale: Locales.fa_ir),
    DataKeys.user_name_from:
        internet_824.user_name_from.copyWith(locale: Locales.fa_ir),
    // fa_ir.location has 1 DataSources
    DataKeys.geo_location:
        location_711.geo_location.copyWith(locale: Locales.fa_ir),
  },
};
