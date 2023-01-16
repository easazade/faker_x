import 'package:fake_it/src/base/fake_it_object.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Dummy test', () {
      for (var i = 0; i < 10; i++) {
        final fakeWord = FakeIt.localized.en_US.lorem.word;
        print(fakeWord);
      }
    });
  });
}
