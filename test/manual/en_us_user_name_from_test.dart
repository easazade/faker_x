import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/global/datasources/internet.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us user_name_from test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.internet
          .userNameFrom(UsernameArgs(firstName: 'alireza')));
      assertFakeValue(FakeIt.localized.en_us.internet
          .userNameFrom(UsernameArgs(lastName: 'easazade')));
      assertFakeValue(FakeIt.localized.en_us.internet.userNameFrom(
          UsernameArgs(lastName: 'easazade', firstName: 'alireza')));
    }
  });
}
