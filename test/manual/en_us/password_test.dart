import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("en_us -> internet -> password test", () async {
    assertFakeValue(
      FakerX.localized.en_us.internet.password(length: 15, onlyNumeric: true),
    );
    assertFakeValue(
      FakerX.localized.en_us.internet.password(length: 8, onlyNumeric: false),
    );
    assertFakeValue(
      FakerX.localized.en_us.internet.password(onlyNumeric: true, length: 9),
    );
  });
}
