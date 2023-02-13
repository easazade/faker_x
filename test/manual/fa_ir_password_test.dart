import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/internet.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir -> internet -> password test", () async {
    assertFakeValue(FakeIt.localized.fa_ir.internet
        .password(PasswordArgs(length: 15, onlyNumeric: true)));
    assertFakeValue(
        FakeIt.localized.fa_ir.internet.password(PasswordArgs(length: 8)));
    assertFakeValue(FakeIt.localized.fa_ir.internet
        .password(PasswordArgs(onlyNumeric: true)));
  });
}
