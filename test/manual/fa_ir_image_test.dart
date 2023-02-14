import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(
        FakeIt.localized.fa_ir.image.image(
          width: 300,
          height: 400,
          keywords: ['pet', 'dog'],
        ),
      );
    }
  });
}
