import 'package:faker_x/src/base/base.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us user_name_from test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(
        FakerX.localized.en_us.internet.userNameFrom(
          firstName: 'alireza',
        ),
      );
      assertFakeValue(
        FakerX.localized.en_us.internet.userNameFrom(
          lastName: 'easazade',
        ),
      );
      assertFakeValue(
        FakerX.localized.en_us.internet.userNameFrom(
          lastName: 'easazade',
          firstName: 'alireza',
        ),
      );
    }
  });
}
