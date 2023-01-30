import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

void main() {
  test("fa_ir address test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.fa_ir.address.buildingName);
      print(FakeIt.localized.fa_ir.address.streetSuffix);
      print(FakeIt.localized.fa_ir.address.state);
      print(FakeIt.localized.fa_ir.address.address);
      print(FakeIt.localized.fa_ir.address.cityName);
      print(FakeIt.localized.fa_ir.address.postcode);
      print(FakeIt.localized.fa_ir.address.buildingNumber);
      print(FakeIt.localized.fa_ir.address.streetName);
      print(FakeIt.localized.fa_ir.address.alley);
      print(FakeIt.localized.fa_ir.address.streetPrefix);
    }
  });

  test("fa_ir job test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.fa_ir.job.jobSuffix);
      print(FakeIt.localized.fa_ir.job.jobTitle);
      print(FakeIt.localized.fa_ir.job.jobPrefix);
    }
  });

  test("fa_ir person test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.fa_ir.person.firstNameMale);
      print(FakeIt.localized.fa_ir.person.fullName);
      print(FakeIt.localized.fa_ir.person.firstNameFemale);
      print(FakeIt.localized.fa_ir.person.lastName);
      print(FakeIt.localized.fa_ir.person.firstName);
    }
  });

  test("fa_ir lorem test", () async {
    for (var i = 0; i < 100; i++) {
      print(FakeIt.localized.fa_ir.lorem.sentence);
      print(FakeIt.localized.fa_ir.lorem.word);
    }
  });
}
