import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test("number test doubleFromPattern", () async {
    for (var i = 0; i < 100; i++) {
      assertFakeValue(FakerX.defaultInstance.number.doubleFromPattern('####'));
    }
  });

  test("number test intFromPattern", () async {
    for (var i = 0; i < 100; i++) {
      assertFakeValue(FakerX.defaultInstance.number.intFromPattern('##'));
    }
  });

  test("number test intFromPattern", () async {
    for (var i = 0; i < 100; i++) {
      assertFakeValue(FakerX.defaultInstance.number.intFromPattern('##'));
    }
  });
}
