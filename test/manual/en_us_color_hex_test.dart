import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us color_hex test", () async {
    for (var i = 0; i < 10000; i++) {
      assertFakeValue(FakeIt.localized.en_us.color.colorHex);
    }
  });
}
