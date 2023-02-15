import 'package:faker_x/src/base/faker_x_class.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir user_name_from test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(
        FakerX.localized.fa_ir.internet.userNameFrom(firstName: 'alireza'),
      );
      assertFakeValue(
        FakerX.localized.fa_ir.internet.userNameFrom(lastName: 'easazade'),
      );
      assertFakeValue(
        FakerX.localized.fa_ir.internet
            .userNameFrom(lastName: 'easazade', firstName: 'alireza'),
      );
    }
  });
}
