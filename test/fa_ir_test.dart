import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test("fa_ir address test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.address.buildingName);
      assertFakeValue(FakeIt.localized.fa_ir.address.streetSuffix);
      assertFakeValue(FakeIt.localized.fa_ir.address.state);
      assertFakeValue(FakeIt.localized.fa_ir.address.address);
      assertFakeValue(FakeIt.localized.fa_ir.address.cityName);
      assertFakeValue(FakeIt.localized.fa_ir.address.postcode);
      assertFakeValue(FakeIt.localized.fa_ir.address.buildingNumber);
      assertFakeValue(FakeIt.localized.fa_ir.address.streetName);
      assertFakeValue(FakeIt.localized.fa_ir.address.alley);
      assertFakeValue(FakeIt.localized.fa_ir.address.streetPrefix);
    }
  });

  test("fa_ir job test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.job.jobSuffix);
      assertFakeValue(FakeIt.localized.fa_ir.job.jobTitle);
      assertFakeValue(FakeIt.localized.fa_ir.job.jobPrefix);
    }
  });

  test("fa_ir person test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.person.lastNameEn);
      assertFakeValue(FakeIt.localized.fa_ir.person.firstNameEn);
      assertFakeValue(FakeIt.localized.fa_ir.person.firstNameMale);
      assertFakeValue(FakeIt.localized.fa_ir.person.fullName);
      assertFakeValue(FakeIt.localized.fa_ir.person.firstNameFemale);
      assertFakeValue(FakeIt.localized.fa_ir.person.lastName);
      assertFakeValue(FakeIt.localized.fa_ir.person.firstName);
    }
  });

  test("fa_ir automotive test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.automotive.licensePlate);
    }
  });

  test("fa_ir color test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.color.colorHex);
      assertFakeValue(FakeIt.localized.fa_ir.color.colorName);
    }
  });

  test("fa_ir lorem test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.lorem.sentence);
      assertFakeValue(FakeIt.localized.fa_ir.lorem.word);
    }
  });

  test("fa_ir vehicle test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.vehicle.car);
    }
  });

  test("fa_ir internet test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.internet.httpUrl);
      assertFakeValue(FakeIt.localized.fa_ir.internet.email);
      assertFakeValue(FakeIt.localized.fa_ir.internet.httpsUrl);
      assertFakeValue(FakeIt.localized.fa_ir.internet.safeEmail);
      assertFakeValue(FakeIt.localized.fa_ir.internet.ipv4);
      assertFakeValue(FakeIt.localized.fa_ir.internet.domainSuffixes);
      assertFakeValue(FakeIt.localized.fa_ir.internet.userName);
      assertFakeValue(FakeIt.localized.fa_ir.internet.disposableEmail);
      assertFakeValue(FakeIt.localized.fa_ir.internet.macAddress);
      assertFakeValue(FakeIt.localized.fa_ir.internet.emoji);
      assertFakeValue(FakeIt.localized.fa_ir.internet.ipv6);
      assertFakeValue(FakeIt.localized.fa_ir.internet.mailProvider);
      assertFakeValue(FakeIt.localized.fa_ir.internet.domainName);
      assertFakeValue(FakeIt.localized.fa_ir.internet.disposableMailProvider);
    }
  });

  test("fa_ir image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.image.avatarUri);
    }
  });
}
