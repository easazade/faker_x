import 'package:fake_it/src/base/fake_it_class.dart';
import 'package:fake_it/src/locales/global/datasources/internet.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir user_name_from test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.internet
          .userNameFrom(UsernameArgs(firstName: 'alireza')));
      assertFakeValue(FakeIt.localized.fa_ir.internet
          .userNameFrom(UsernameArgs(lastName: 'easazade')));
      assertFakeValue(FakeIt.localized.fa_ir.internet.userNameFrom(
          UsernameArgs(lastName: 'easazade', firstName: 'alireza')));
    }
  });
}
