// ignore_for_file: unused_import

import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("en_us -> lorem -> paragraph test", () async {
    for (var i = 0; i < testRepeatCount; i++) {
      assertFakeValue(FakerX.localized.en_us.lorem.paragraph(maxSentences: 4));
    }
  });
}
