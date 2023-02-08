import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/internet.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir -> internet -> email test", () async {
    for (var i = 0; i < 100; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.internet
          .email(EmailArgs(firstName: 'alireza')));
      assertFakeValue(FakeIt.localized.fa_ir.internet.email(EmailArgs()));
    }
  });
}
