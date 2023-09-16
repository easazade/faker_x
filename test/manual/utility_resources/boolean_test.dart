import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("boolean test random", () async {
    final allResults = [];
    for (var i = 0; i < testRepeatCount; i++) {
      final result = FakerX.defaultInstance.boolean.random;
      allResults.add(result);
      assertFakeValue(result);
    }
    expect(allResults.contains(true), isTrue);
    expect(allResults.contains(false), isTrue);
  });
}
