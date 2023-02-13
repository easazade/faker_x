import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/internet.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us -> internet -> email_from test", () async {
    assertFakeValue(FakeIt.localized.en_us.internet.emailFrom(EmailArgs(
        firstName: 'ali', lastName: 'easazade', provider: 'gmail.com')));
  });
}
