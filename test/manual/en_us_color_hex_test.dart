import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us color_hex test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.color.colorHex);
    }
  });
}
