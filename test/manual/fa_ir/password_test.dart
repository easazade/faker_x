import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("fa_ir -> internet -> password test", () async {
    assertFakeValue(
      FakerX.localized.fa_ir.internet.password(length: 15, onlyNumeric: true),
    );
    assertFakeValue(
      FakerX.localized.fa_ir.internet.password(length: 8),
    );
    assertFakeValue(
      FakerX.localized.fa_ir.internet.password(onlyNumeric: true),
    );
  });
}
