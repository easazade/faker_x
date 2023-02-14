import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir -> internet -> password test", () async {
    assertFakeValue(
      FakeIt.localized.fa_ir.internet.password(length: 15, onlyNumeric: true),
    );
    assertFakeValue(
      FakeIt.localized.fa_ir.internet.password(length: 8),
    );
    assertFakeValue(
      FakeIt.localized.fa_ir.internet.password(onlyNumeric: true),
    );
  });
}
