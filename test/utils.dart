// ignore: unused_import
import 'package:faker_x/src/base/utils.dart';
import 'package:test/expect.dart';

const testRepeatCount = 1;

void assertFakeValue(dynamic value) {
  expect(value, isNotNull);
  if (value is String) {
    expect(value, isNotBlankString);
    expect(value.contains('Instance of'), isFalse);
  }

  // printing a lot causes laptop to freeze :)
  // only wanna print for debug purposes
  if (testRepeatCount <= 1) {
    print(value);
  }
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
