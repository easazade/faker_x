import 'package:fake_it/src/base/fake_it_class.dart';
import 'package:fake_it/src/base/format.dart';
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

    test('test Format class returns the correct keys', () {
      final format = Format('{{first_names}} {{last_names}}');
      final keys = format.keys;

      expect(keys[0], 'first_names');
      expect(keys[1], 'last_names');
    });
  });
}
