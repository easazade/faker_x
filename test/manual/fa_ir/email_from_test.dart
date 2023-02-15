import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("fa_ir -> internet -> email_from test", () async {
    assertFakeValue(
      FakerX.localized.fa_ir.internet.emailFrom(
          firstName: 'ali', lastName: 'easazade', provider: 'gmail.com'),
    );
  });
}
