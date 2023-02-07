import 'package:fake_it/fake_it.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir license_plate test", () async {
    for (var i = 0; i < 10000; i++) {
      assertFakeValue(FakeIt.localized.fa_ir.automotive.licensePlate);
    }
  });
}
