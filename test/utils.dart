import 'package:test/expect.dart';

void assertFakeValue(String? value) {
  expect(value, isNotNull);
  expect(value, isNotEmpty);
  print(value);
}

const testRepeatCount = 10000;
