import 'package:fake_it/src/base/fake_it_class.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us user_name test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.en_us.internet.userName);
    }
  });
}
