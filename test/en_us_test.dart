import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

void main() {
  test("en_us address test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.en_us.address.stateAbbr);
      print(FakeIt.localized.en_us.address.state);
      print(FakeIt.localized.en_us.address.address);
      print(FakeIt.localized.en_us.address.cityName);
      print(FakeIt.localized.en_us.address.neighborhood);
      print(FakeIt.localized.en_us.address.buildingNumber);
      print(FakeIt.localized.en_us.address.citySuffix);
      print(FakeIt.localized.en_us.address.streetSuffix);
      print(FakeIt.localized.en_us.address.streetAddress);
      print(FakeIt.localized.en_us.address.postcode);
      print(FakeIt.localized.en_us.address.streetName);
      print(FakeIt.localized.en_us.address.postcodeFormat);
      print(FakeIt.localized.en_us.address.cityPrefix);
      print(FakeIt.localized.en_us.address.secondaryAddress);
    }
  });

  test("en_us job test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.en_us.job.jobSuffix);
      print(FakeIt.localized.en_us.job.jobTitle);
      print(FakeIt.localized.en_us.job.jobPrefix);
    }
  });

  test("en_us person test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.en_us.person.firstNameMale);
      print(FakeIt.localized.en_us.person.fullName);
      print(FakeIt.localized.en_us.person.firstNameFemale);
      print(FakeIt.localized.en_us.person.lastName);
      print(FakeIt.localized.en_us.person.firstName);
    }
  });

  test("en_us lorem test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.en_us.lorem.sentence);
      print(FakeIt.localized.en_us.lorem.word);
    }
  });
}
