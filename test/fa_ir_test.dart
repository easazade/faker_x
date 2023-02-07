import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test("fa_ir address test", () async {
    for (var i = 0; i < 10000; i++) {
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
    for (var i = 0; i < 10000; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.job.jobSuffix);
      assertFakeValue(FakeIt.localized.fa_ir.job.jobTitle);
      assertFakeValue(FakeIt.localized.fa_ir.job.jobPrefix);
    }
  });

  test("fa_ir person test", () async {
    for (var i = 0; i < 10000; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.person.firstNameMale);
      assertFakeValue(FakeIt.localized.fa_ir.person.fullName);
      assertFakeValue(FakeIt.localized.fa_ir.person.firstNameFemale);
      assertFakeValue(FakeIt.localized.fa_ir.person.lastName);
      assertFakeValue(FakeIt.localized.fa_ir.person.firstName);
    }
  });

  test("fa_ir automotive test", () async {
    for (var i = 0; i < 10000; i++) {}
  });

  test("fa_ir lorem test", () async {
    for (var i = 0; i < 10000; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.lorem.sentence);
      assertFakeValue(FakeIt.localized.fa_ir.lorem.word);
    }
  });

  test("fa_ir vehicle test", () async {
    for (var i = 0; i < 10000; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.vehicle.car);
    }
  });

  test("fa_ir image test", () async {
    for (var i = 0; i < 10000; i++) {}
  });
}
