import 'package:fake_it/fake_it.dart';

void main() {
  print(FakeIt.defaultInstance.address.address);

  print(FakeIt.defaultInstance.person.fullName);
  print(FakeIt.defaultInstance.person.firstNameFemale);

  print(FakeIt.localized.en_us.lorem.sentence);
  print(FakeIt.localized.en_us.person.firstName);

  print(FakeIt.localized.fa_ir.lorem.sentence);
  print(FakeIt.localized.fa_ir.person.firstName);
}
