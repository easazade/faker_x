import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test("en_us address test", () async {
    for (var i = 0; i < 100; i++) {
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
    for (var i = 0; i < 100; i++) {
      assertFakeValue(FakeIt.localized.en_us.job.jobSuffix);
      assertFakeValue(FakeIt.localized.en_us.job.jobTitle);
      assertFakeValue(FakeIt.localized.en_us.job.jobPrefix);
    }
  });

  test("en_us person test", () async {
    for (var i = 0; i < 100; i++) {
      assertFakeValue(FakeIt.localized.en_us.person.firstNameMale);
      assertFakeValue(FakeIt.localized.en_us.person.fullName);
      assertFakeValue(FakeIt.localized.en_us.person.firstNameFemale);
      assertFakeValue(FakeIt.localized.en_us.person.lastName);
      assertFakeValue(FakeIt.localized.en_us.person.firstName);
    }
  });

  test("en_us lorem test", () async {
    for (var i = 0; i < 100; i++) {
      assertFakeValue(FakeIt.localized.en_us.lorem.sentence);
      assertFakeValue(FakeIt.localized.en_us.lorem.word);
    }
  });
}
