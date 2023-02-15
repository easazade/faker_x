import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir -> internet -> uri test", () async {
    assertFakeValue(FakerX.localized.fa_ir.internet.uri(protocol: 'ftp'));
    assertFakeValue(FakerX.localized.fa_ir.internet.uri(protocol: 'https'));
  });
}
