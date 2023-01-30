import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

void main() {
  test("fa_ir address test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.fa_ir.address.buildingName;
      FakeIt.localized.fa_ir.address.streetSuffix;
      FakeIt.localized.fa_ir.address.state;
      FakeIt.localized.fa_ir.address.address;
      FakeIt.localized.fa_ir.address.cityName;
      FakeIt.localized.fa_ir.address.postcode;
      FakeIt.localized.fa_ir.address.buildingNumber;
      FakeIt.localized.fa_ir.address.streetName;
      FakeIt.localized.fa_ir.address.alley;
      FakeIt.localized.fa_ir.address.streetPrefix;
    }
  });

  test("fa_ir job test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.fa_ir.job.jobSuffix;
      FakeIt.localized.fa_ir.job.jobTitle;
      FakeIt.localized.fa_ir.job.jobPrefix;
    }
  });

  test("fa_ir person test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.fa_ir.person.firstNameMale;
      FakeIt.localized.fa_ir.person.fullName;
      FakeIt.localized.fa_ir.person.firstNameFemale;
      FakeIt.localized.fa_ir.person.lastName;
      FakeIt.localized.fa_ir.person.firstName;
    }
  });

  test("fa_ir lorem test", () async {
    for (var i = 0; i < 100; i++) {
      FakeIt.localized.fa_ir.lorem.sentence;
      FakeIt.localized.fa_ir.lorem.word;
    }
  });
}
