import 'package:faker_x/src/base/faker_x_class.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us user_name test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.internet.userName);
    }
  });
}
