import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us -> internet -> password test", () async {
    assertFakeValue(
      FakeIt.localized.en_us.internet.password(length: 15, onlyNumeric: true),
    );
    assertFakeValue(
      FakeIt.localized.en_us.internet.password(length: 8, onlyNumeric: false),
    );
    assertFakeValue(
      FakeIt.localized.en_us.internet.password(onlyNumeric: true, length: 9),
    );
  });
}
