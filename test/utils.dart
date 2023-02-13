import 'package:test/expect.dart';

void assertFakeValue(dynamic value) {
  expect(value, isNotNull);
  if (value is String) {
    expect(value, isNotEmpty);
  }
  // print(value);
}

const testRepeatCount = 10000;
