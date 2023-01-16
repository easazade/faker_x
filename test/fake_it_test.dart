import 'package:fake_it/src/base/fake_it_object.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Preview words', () {
      for (var i = 0; i < 3; i++) {
        print(FakeIt.localized.en_US.lorem.word);
        print(FakeIt.localized.en_US.lorem.sentence);
        print(FakeIt.localized.en_US.job.jobTitle);

        print(FakeIt.localized.fa_IR.lorem.word);
        print(FakeIt.localized.fa_IR.lorem.sentence);
        print(FakeIt.localized.fa_IR.job.jobTitle);

      }
    });
  });
}
