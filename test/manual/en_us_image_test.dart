import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/image.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us image test", () async {
    for (var i = 0; i < 10000; i++) {
      assertFakeValue(FakeIt.localized.en_us.image
          .image(ImageArgs(300, 400, ['pet', 'dog'])));
    }
  });
}
