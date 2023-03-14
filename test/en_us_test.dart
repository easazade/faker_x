/// !!!! DO NOT MODIFY BY HAND !!!!
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
  test("en_us phone test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.phone.phoneNumber);
      assertFakeValue(FakerX.localized.en_us.phone.internationalPhoneNumber);
    }
  });

  test("en_us address test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.address.stateAbbr);
      assertFakeValue(FakerX.localized.en_us.address.state);
      assertFakeValue(FakerX.localized.en_us.address.address);
      assertFakeValue(FakerX.localized.en_us.address.cityName);
      assertFakeValue(FakerX.localized.en_us.address.neighborhood);
      assertFakeValue(FakerX.localized.en_us.address.buildingNumber);
      assertFakeValue(FakerX.localized.en_us.address.citySuffix);
      assertFakeValue(FakerX.localized.en_us.address.streetSuffix);
      assertFakeValue(FakerX.localized.en_us.address.streetAddress);
      assertFakeValue(FakerX.localized.en_us.address.postcode);
      assertFakeValue(FakerX.localized.en_us.address.streetName);
      assertFakeValue(FakerX.localized.en_us.address.postcodeFormat);
      assertFakeValue(FakerX.localized.en_us.address.cityPrefix);
      assertFakeValue(FakerX.localized.en_us.address.secondaryAddress);
    }
  });

  test("en_us job test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.job.jobSuffix);
      assertFakeValue(FakerX.localized.en_us.job.jobTitle);
      assertFakeValue(FakerX.localized.en_us.job.jobPrefix);
    }
  });

  test("en_us person test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.person.lastNameEn);
      assertFakeValue(FakerX.localized.en_us.person.firstNameEn);
      assertFakeValue(FakerX.localized.en_us.person.firstNameMale);
      assertFakeValue(FakerX.localized.en_us.person.fullName);
      assertFakeValue(FakerX.localized.en_us.person.firstNameFemale);
      assertFakeValue(FakerX.localized.en_us.person.lastName);
      assertFakeValue(FakerX.localized.en_us.person.firstName);
    }
  });

  test("en_us automotive test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.automotive.licensePlate);
    }
  });

  test("en_us color test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.color.colorHex);
      assertFakeValue(FakerX.localized.en_us.color.colorName);
    }
  });

  test("en_us lorem test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.lorem.sentence);
      assertFakeValue(FakerX.localized.en_us.lorem.word);
    }
  });

  test("en_us animal test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.animal.animalName);
    }
  });

  test("en_us vehicle test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.vehicle.car);
    }
  });

  test("en_us internet test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.internet.httpUrl);
      assertFakeValue(FakerX.localized.en_us.internet.email);
      assertFakeValue(FakerX.localized.en_us.internet.httpsUrl);
      assertFakeValue(FakerX.localized.en_us.internet.safeEmail);
      assertFakeValue(FakerX.localized.en_us.internet.ipv4);
      assertFakeValue(FakerX.localized.en_us.internet.domainSuffixes);
      assertFakeValue(FakerX.localized.en_us.internet.userName);
      assertFakeValue(FakerX.localized.en_us.internet.disposableEmail);
      assertFakeValue(FakerX.localized.en_us.internet.macAddress);
      assertFakeValue(FakerX.localized.en_us.internet.emoji);
      assertFakeValue(FakerX.localized.en_us.internet.ipv6);
      assertFakeValue(FakerX.localized.en_us.internet.mailProvider);
      assertFakeValue(FakerX.localized.en_us.internet.domainName);
      assertFakeValue(FakerX.localized.en_us.internet.disposableMailProvider);
    }
  });

  test("en_us image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.image.avatarUri);
    }
  });

  test("en_us location test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.location.geoLocation);
    }
  });
}
