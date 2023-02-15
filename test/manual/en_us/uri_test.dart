import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("en_us -> internet -> uri test", () async {
    assertFakeValue(FakerX.localized.en_us.internet.uri(protocol: 'ftp'));
    assertFakeValue(FakerX.localized.en_us.internet.uri(protocol: 'https'));
  });
}
