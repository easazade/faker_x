import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/internet.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir -> internet -> email_from test", () async {
    assertFakeValue(FakeIt.localized.fa_ir.internet.emailFrom(EmailArgs(
        firstName: 'ali', lastName: 'easazade', provider: 'gmail.com')));
  });
}
