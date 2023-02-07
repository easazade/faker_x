import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/image.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir image test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.image
          .image(ImageArgs(300, 400, ['pet', 'dog'])));
    }
  });
}
