import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("en_us -> internet -> email_from test", () async {
    assertFakeValue(FakerX.localized.en_us.internet.emailFrom(
      firstName: 'ali',
      lastName: 'easazade',
      provider: 'gmail.com',
    ));
  });
}
