import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

void main() {
  test("en_us address test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.en_us.address.stateAbbr;
      FakeIt.localized.en_us.address.state;
      FakeIt.localized.en_us.address.address;
      FakeIt.localized.en_us.address.cityName;
      FakeIt.localized.en_us.address.neighborhood;
      FakeIt.localized.en_us.address.buildingNumber;
      FakeIt.localized.en_us.address.citySuffix;
      FakeIt.localized.en_us.address.streetSuffix;
      FakeIt.localized.en_us.address.streetAddress;
      FakeIt.localized.en_us.address.postcode;
      FakeIt.localized.en_us.address.streetName;
      FakeIt.localized.en_us.address.postcodeFormat;
      FakeIt.localized.en_us.address.cityPrefix;
      FakeIt.localized.en_us.address.secondaryAddress;
    }
  });

  test("en_us job test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.en_us.job.jobSuffix;
      FakeIt.localized.en_us.job.jobTitle;
      FakeIt.localized.en_us.job.jobPrefix;
    }
  });

  test("en_us person test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.en_us.person.firstNameMale;
      FakeIt.localized.en_us.person.fullName;
      FakeIt.localized.en_us.person.firstNameFemale;
      FakeIt.localized.en_us.person.lastName;
      FakeIt.localized.en_us.person.firstName;
    }
  });

  test("en_us lorem test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.en_us.lorem.sentence;
      FakeIt.localized.en_us.lorem.word;
    }
  });
}
