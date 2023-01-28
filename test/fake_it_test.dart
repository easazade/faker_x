import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Preview words', () {
      for (var i = 0; i < 100; i++) {
        // print(FakeIt.localized.en_us.lorem.word);
        print(FakeIt.localized.en_us.lorem.sentences);
        // print(FakeIt.localized.en_us.job.jobTitle);

        // print(FakeIt.localized.fa_ir.lorem.word);
        // print(FakeIt.localized.fa_ir.extra.something);
        // print(FakeIt.localized.en_us.job.jobTitle);
      }
    });

    test('test Format class returns the correct keys', () {
      final format = Format('{{first_names}} {{last_names}}');
      final keys = format.keys;

      expect(keys[0], 'first_names');
      expect(keys[1], 'last_names');
    });

    test('test Format class parses correctly', () {
      final format = Format('{{first_names}} {{last_names}}');
      final parsed = format.parse(['alireza', 'easazade']);
      print(parsed);
      expect(parsed, 'alireza easazade');
    });

    test('preview coinToss method works', () {
      print(coinToss('heads', 'tails'));
    });
  });
}
