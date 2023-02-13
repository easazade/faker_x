import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test("en_us address test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.address.stateAbbr);
      assertFakeValue(FakeIt.localized.en_us.address.state);
      assertFakeValue(FakeIt.localized.en_us.address.address);
      assertFakeValue(FakeIt.localized.en_us.address.cityName);
      assertFakeValue(FakeIt.localized.en_us.address.neighborhood);
      assertFakeValue(FakeIt.localized.en_us.address.buildingNumber);
      assertFakeValue(FakeIt.localized.en_us.address.citySuffix);
      assertFakeValue(FakeIt.localized.en_us.address.streetSuffix);
      assertFakeValue(FakeIt.localized.en_us.address.streetAddress);
      assertFakeValue(FakeIt.localized.en_us.address.postcode);
      assertFakeValue(FakeIt.localized.en_us.address.streetName);
      assertFakeValue(FakeIt.localized.en_us.address.postcodeFormat);
      assertFakeValue(FakeIt.localized.en_us.address.cityPrefix);
      assertFakeValue(FakeIt.localized.en_us.address.secondaryAddress);
    }
  });

  test("en_us job test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.job.jobSuffix);
      assertFakeValue(FakeIt.localized.en_us.job.jobTitle);
      assertFakeValue(FakeIt.localized.en_us.job.jobPrefix);
    }
  });

  test("en_us person test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.person.lastNameEn);
      assertFakeValue(FakeIt.localized.en_us.person.firstNameEn);
      assertFakeValue(FakeIt.localized.en_us.person.firstNameMale);
      assertFakeValue(FakeIt.localized.en_us.person.fullName);
      assertFakeValue(FakeIt.localized.en_us.person.firstNameFemale);
      assertFakeValue(FakeIt.localized.en_us.person.lastName);
      assertFakeValue(FakeIt.localized.en_us.person.firstName);
    }
  });

  test("en_us automotive test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.automotive.licensePlate);
    }
  });

  test("en_us color test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.color.colorHex);
      assertFakeValue(FakeIt.localized.en_us.color.colorName);
    }
  });

  test("en_us lorem test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.lorem.sentence);
      assertFakeValue(FakeIt.localized.en_us.lorem.word);
    }
  });

  test("en_us vehicle test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.vehicle.car);
    }
  });

  test("en_us internet test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.internet.httpUrl);
      assertFakeValue(FakeIt.localized.en_us.internet.email);
      assertFakeValue(FakeIt.localized.en_us.internet.httpsUrl);
      assertFakeValue(FakeIt.localized.en_us.internet.safeEmail);
      assertFakeValue(FakeIt.localized.en_us.internet.ipv4);
      assertFakeValue(FakeIt.localized.en_us.internet.domainSuffixes);
      assertFakeValue(FakeIt.localized.en_us.internet.userName);
      assertFakeValue(FakeIt.localized.en_us.internet.disposableEmail);
      assertFakeValue(FakeIt.localized.en_us.internet.macAddress);
      assertFakeValue(FakeIt.localized.en_us.internet.emoji);
      assertFakeValue(FakeIt.localized.en_us.internet.ipv6);
      assertFakeValue(FakeIt.localized.en_us.internet.mailProvider);
      assertFakeValue(FakeIt.localized.en_us.internet.domainName);
      assertFakeValue(FakeIt.localized.en_us.internet.disposableMailProvider);
    }
  });

  test("en_us image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.image.avatarUri);
    }
  });
}
