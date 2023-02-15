import 'package:faker_x/src/base/base.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir user_name test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.fa_ir.internet.userName);
    }
  });
}
