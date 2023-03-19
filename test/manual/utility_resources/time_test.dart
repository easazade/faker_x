import 'package:faker_x/faker_x.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('Test random date times', () {
    for (var i = 0; i < testRepeatCount; i++) {
      final minDateTime =
          DateTime.now().subtract(Duration(days: randomInt(20000)));
      final maxDateTime = DateTime.now().add(Duration(days: randomInt(20000)));

      final dateTime = FakerX.defaultInstance.time.randomDateTime(
        min: minDateTime,
        max: maxDateTime,
      );
      assertFakeValue(dateTime);
      expect(dateTime.isAfter(minDateTime) && dateTime.isBefore(maxDateTime),
          isTrue);
    }
  });

  test('Test future date times', () {
    final now = DateTime.now();
    for (var i = 0; i < testRepeatCount; i++) {
      final dateTime = FakerX.defaultInstance.time.futureDateTime(
        Duration(days: randomInt(20000)),
      );
      assertFakeValue(dateTime);
      expect(dateTime.isAfter(now), isTrue);
    }
  });

  test('Test past date times', () {
    final oneMinuteFromNow = DateTime.now().add(const Duration(minutes: 1));

    for (var i = 0; i < testRepeatCount; i++) {
      final dateTime = FakerX.defaultInstance.time.pastDateTime(
        Duration(days: randomInt(20000)),
      );
      assertFakeValue(dateTime);
      expect(dateTime.isBefore(oneMinuteFromNow), isTrue);
    }
  });
}
