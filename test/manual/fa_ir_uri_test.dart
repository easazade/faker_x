import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir -> internet -> uri test", () async {
    assertFakeValue(FakeIt.localized.fa_ir.internet.uri(protocol: 'ftp'));
    assertFakeValue(FakeIt.localized.fa_ir.internet.uri(protocol: 'https'));
  });
}
