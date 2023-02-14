import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(
        FakeIt.localized.en_us.image.image(
          width: 300,
          height: 400,
          keywords: ['pet', 'dog'],
        ),
      );
    }
  });
}
