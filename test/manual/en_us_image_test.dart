import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(
        FakerX.localized.en_us.image.image(
          width: 300,
          height: 400,
          keywords: ['pet', 'dog'],
        ),
      );
    }
  });
}
