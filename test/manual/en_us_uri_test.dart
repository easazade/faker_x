import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("en_us -> internet -> uri test", () async {
    assertFakeValue(FakeIt.localized.en_us.internet.uri(protocol: 'ftp'));
    assertFakeValue(FakeIt.localized.en_us.internet.uri(protocol: 'https'));
  });
}
