// ignore: unused_import
import 'package:faker_x/src/base/utils.dart';
import 'package:test/expect.dart';

const testRepeatCount = 10000;

void assertFakeValue(dynamic value) {
  expect(value, isNotNull);
  if (value is String) {
    expect(value, isNotBlankString);
  }
  // print(value);
}

const Matcher isNotBlankString = _NotBlank();

class _NotBlank extends Matcher {
  const _NotBlank();

  @override
  bool matches(final Object? item, Map matchState) {
    if (item is String) {
      return item.isNotBlank;
    }

    return false;
  }

  @override
  Description describe(Description description) => description.add('non-blank');
}
