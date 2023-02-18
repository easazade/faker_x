/// !!!! DO NOY MODIFY MANUALLY !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make
/// to this file will be removed when code generation takes effect.
///
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test("fa_ir phone test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.phone.phoneNumber);
      assertFakeValue(FakerX.localized.fa_ir.phone.internationalPhoneNumber);
    }
  });

  test("fa_ir address test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.address.buildingName);
      assertFakeValue(FakerX.localized.fa_ir.address.streetSuffix);
      assertFakeValue(FakerX.localized.fa_ir.address.state);
      assertFakeValue(FakerX.localized.fa_ir.address.address);
      assertFakeValue(FakerX.localized.fa_ir.address.cityName);
      assertFakeValue(FakerX.localized.fa_ir.address.postcode);
      assertFakeValue(FakerX.localized.fa_ir.address.buildingNumber);
      assertFakeValue(FakerX.localized.fa_ir.address.streetName);
      assertFakeValue(FakerX.localized.fa_ir.address.alley);
      assertFakeValue(FakerX.localized.fa_ir.address.streetPrefix);
    }
  });

  test("fa_ir job test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.job.jobTitle);
    }
  });

  test("fa_ir person test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.person.lastNameEn);
      assertFakeValue(FakerX.localized.fa_ir.person.firstNameEn);
      assertFakeValue(FakerX.localized.fa_ir.person.firstNameMale);
      assertFakeValue(FakerX.localized.fa_ir.person.fullName);
      assertFakeValue(FakerX.localized.fa_ir.person.firstNameFemale);
      assertFakeValue(FakerX.localized.fa_ir.person.lastName);
      assertFakeValue(FakerX.localized.fa_ir.person.firstName);
    }
  });

  test("fa_ir automotive test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.automotive.licensePlate);
    }
  });

  test("fa_ir color test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.color.colorHex);
      assertFakeValue(FakerX.localized.fa_ir.color.colorName);
    }
  });

  test("fa_ir lorem test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.lorem.sentence);
      assertFakeValue(FakerX.localized.fa_ir.lorem.word);
    }
  });

  test("fa_ir animal test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.animal.animalName);
    }
  });

  test("fa_ir vehicle test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.vehicle.car);
    }
  });

  test("fa_ir internet test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.internet.httpUrl);
      assertFakeValue(FakerX.localized.fa_ir.internet.email);
      assertFakeValue(FakerX.localized.fa_ir.internet.httpsUrl);
      assertFakeValue(FakerX.localized.fa_ir.internet.safeEmail);
      assertFakeValue(FakerX.localized.fa_ir.internet.ipv4);
      assertFakeValue(FakerX.localized.fa_ir.internet.domainSuffixes);
      assertFakeValue(FakerX.localized.fa_ir.internet.userName);
      assertFakeValue(FakerX.localized.fa_ir.internet.disposableEmail);
      assertFakeValue(FakerX.localized.fa_ir.internet.macAddress);
      assertFakeValue(FakerX.localized.fa_ir.internet.emoji);
      assertFakeValue(FakerX.localized.fa_ir.internet.ipv6);
      assertFakeValue(FakerX.localized.fa_ir.internet.mailProvider);
      assertFakeValue(FakerX.localized.fa_ir.internet.domainName);
      assertFakeValue(FakerX.localized.fa_ir.internet.disposableMailProvider);
    }
  });

  test("fa_ir image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.image.avatarUri);
    }
  });

  test("fa_ir location test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.location.geoLocation);
    }
  });
}
