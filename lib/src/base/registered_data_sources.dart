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
    DataKeys.address: address_237.address,
    DataKeys.building_number: address_237.building_number,
    DataKeys.city_name: address_237.city_name,
    DataKeys.city_prefix: address_237.city_prefix,
    DataKeys.city_suffix: address_237.city_suffix,
    DataKeys.neighborhood: address_237.neighborhood,
    DataKeys.postcode: address_237.postcode,
    DataKeys.postcode_format: address_237.postcode_format,
    DataKeys.secondary_address: address_237.secondary_address,
    DataKeys.state: address_237.state,
    DataKeys.state_abbr: address_237.state_abbr,
    DataKeys.street_address: address_237.street_address,
    DataKeys.street_name: address_237.street_name,
    DataKeys.street_suffix: address_237.street_suffix,
    // en_us.animal has 1 DataSources
    DataKeys.animal_name: animal_354.animal_name,
    // en_us.vehicle has 1 DataSources
    DataKeys.car: vehicle_661.car,
    // en_us.color has 2 DataSources
    DataKeys.color_hex: color_257.color_hex,
    DataKeys.color_name: color_180.color_name,
    // en_us.person has 7 DataSources
    DataKeys.first_name_en: person_886.first_name_en,
    DataKeys.last_name_en: person_886.last_name_en,
    DataKeys.first_name: person_873.first_name,
    DataKeys.first_name_female: person_873.first_name_female,
    DataKeys.first_name_male: person_873.first_name_male,
    DataKeys.full_name: person_873.full_name,
    DataKeys.last_name: person_873.last_name,
    // en_us.phone has 2 DataSources
    DataKeys.international_phone_number: phone_59.international_phone_number,
    DataKeys.phone_number: phone_59.phone_number,
    // en_us.job has 3 DataSources
    DataKeys.job_prefix: job_914.job_prefix,
    DataKeys.job_suffix: job_914.job_suffix,
    DataKeys.job_title: job_914.job_title,
    // en_us.automotive has 1 DataSources
    DataKeys.license_plate: automotive_744.license_plate,
    // en_us.lorem has 3 DataSources
    DataKeys.paragraph: lorem_536.paragraph,
    DataKeys.sentence: lorem_915.sentence,
    DataKeys.word: lorem_915.word,
    // en_us.image has 2 DataSources
    DataKeys.avatar_uri: image_121.avatar_uri,
    DataKeys.image: image_121.image,
    // en_us.internet has 18 DataSources
    DataKeys.disposable_email: internet_824.disposable_email,
    DataKeys.disposable_mail_provider: internet_824.disposable_mail_provider,
    DataKeys.domain_name: internet_824.domain_name,
    DataKeys.domain_suffixes: internet_824.domain_suffixes,
    DataKeys.email: internet_824.email,
    DataKeys.email_from: internet_824.email_from,
    DataKeys.emoji: internet_824.emoji,
    DataKeys.http_url: internet_824.http_url,
    DataKeys.https_url: internet_824.https_url,
    DataKeys.ipv4: internet_824.ipv4,
    DataKeys.ipv6: internet_824.ipv6,
    DataKeys.mac_address: internet_824.mac_address,
    DataKeys.mail_provider: internet_824.mail_provider,
    DataKeys.password: internet_824.password,
    DataKeys.safe_email: internet_824.safe_email,
    DataKeys.uri: internet_824.uri,
    DataKeys.user_name: internet_824.user_name,
    DataKeys.user_name_from: internet_824.user_name_from,
    // en_us.location has 1 DataSources
    DataKeys.geo_location: location_711.geo_location,
  },
  Locales.fa_ir: {
    // fa_ir.address has 10 DataSources
    DataKeys.address: address_449.address,
    DataKeys.alley: address_449.alley,
    DataKeys.building_name: address_449.building_name,
    DataKeys.building_number: address_449.building_number,
    DataKeys.city_name: address_449.city_name,
    DataKeys.postcode: address_449.postcode,
    DataKeys.state: address_449.state,
    DataKeys.street_name: address_449.street_name,
    DataKeys.street_prefix: address_449.street_prefix,
    DataKeys.street_suffix: address_449.street_suffix,
    // fa_ir.animal has 1 DataSources
    DataKeys.animal_name: animal_679.animal_name,
    // fa_ir.vehicle has 1 DataSources
    DataKeys.car: vehicle_225.car,
    // fa_ir.color has 2 DataSources
    DataKeys.color_hex: color_257.color_hex,
    DataKeys.color_name: color_783.color_name,
    // fa_ir.person has 7 DataSources
    DataKeys.first_name_en: person_886.first_name_en,
    DataKeys.last_name_en: person_886.last_name_en,
    DataKeys.first_name: person_378.first_name,
    DataKeys.first_name_female: person_378.first_name_female,
    DataKeys.first_name_male: person_378.first_name_male,
    DataKeys.full_name: person_378.full_name,
    DataKeys.last_name: person_378.last_name,
    // fa_ir.phone has 2 DataSources
    DataKeys.international_phone_number: phone_653.international_phone_number,
    DataKeys.phone_number: phone_653.phone_number,
    // fa_ir.job has 1 DataSources
    DataKeys.job_title: job_938.job_title,
    // fa_ir.automotive has 1 DataSources
    DataKeys.license_plate: automotive_31.license_plate,
    // fa_ir.lorem has 3 DataSources
    DataKeys.paragraph: lorem_536.paragraph,
    DataKeys.sentence: lorem_817.sentence,
    DataKeys.word: lorem_817.word,
    // fa_ir.image has 2 DataSources
    DataKeys.avatar_uri: image_121.avatar_uri,
    DataKeys.image: image_121.image,
    // fa_ir.internet has 18 DataSources
    DataKeys.disposable_email: internet_824.disposable_email,
    DataKeys.disposable_mail_provider: internet_824.disposable_mail_provider,
    DataKeys.domain_name: internet_824.domain_name,
    DataKeys.domain_suffixes: internet_824.domain_suffixes,
    DataKeys.email: internet_824.email,
    DataKeys.email_from: internet_824.email_from,
    DataKeys.emoji: internet_824.emoji,
    DataKeys.http_url: internet_824.http_url,
    DataKeys.https_url: internet_824.https_url,
    DataKeys.ipv4: internet_824.ipv4,
    DataKeys.ipv6: internet_824.ipv6,
    DataKeys.mac_address: internet_824.mac_address,
    DataKeys.mail_provider: internet_824.mail_provider,
    DataKeys.password: internet_824.password,
    DataKeys.safe_email: internet_824.safe_email,
    DataKeys.uri: internet_824.uri,
    DataKeys.user_name: internet_824.user_name,
    DataKeys.user_name_from: internet_824.user_name_from,
    // fa_ir.location has 1 DataSources
    DataKeys.geo_location: location_711.geo_location,
  },
};
