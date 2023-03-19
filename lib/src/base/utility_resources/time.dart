import 'package:faker_x/src/base/base.dart';

class Time {
  const Time();

  DateTime randomDateTime({DateTime? min, DateTime? max}) {
    min ??= DateTime.fromMillisecondsSinceEpoch(0);
    max ??= DateTime(2099);

    final milliseconds = _randomInt2(max.millisecondsSinceEpoch,
        min: min.millisecondsSinceEpoch);
    return DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }

  DateTime futureDateTime(Duration range) {
    final now = DateTime.now();
    final extraMilliseconds = _randomInt2(range.inMilliseconds);
    return DateTime.fromMillisecondsSinceEpoch(
        now.millisecondsSinceEpoch + extraMilliseconds);
  }

  DateTime pastDateTime(Duration range) {
    final now = DateTime.now();
    final extraMilliseconds = _randomInt2(range.inMilliseconds);
    return DateTime.fromMillisecondsSinceEpoch(
        now.millisecondsSinceEpoch - extraMilliseconds);
  }
}

/// this is not perfect, but it works for now.
/// this returns a random integer for values that are even bigger than 2^32
/// TODO: the correct way is to implement a function that returns a randomBigInt
int _randomInt2(int max, {int min = 0}) {
  final maxDuration = Duration(milliseconds: max);
  final minDuration = Duration(milliseconds: min);

  final maxMinutes = maxDuration.inMinutes;
  final maxRemainingMillis = maxDuration - Duration(minutes: maxMinutes);

  final minMinutes = minDuration.inMinutes;
  final minRemainingMillis = minDuration - Duration(minutes: minMinutes);

  final randomMinutes =
      maxMinutes == 0 ? 0 : randomInt(maxMinutes, min: minMinutes);

  var diffInMillis =
      (maxRemainingMillis.inMilliseconds - minRemainingMillis.inMilliseconds)
          .abs();
  final randomRemainingMillis = minRemainingMillis.inMilliseconds +
      ((diffInMillis == 0) ? 0 : randomInt(diffInMillis));

  return Duration(minutes: randomMinutes).inMilliseconds +
      randomRemainingMillis;
}

// BigInt _randomBigInt(BigInt max, {BigInt? min}) {
//   min ??= BigInt.zero;
//   final difference = max - min;

//   final chunkSize = 2 ^ 32;
//   final integerChunks = <int>[
//     ...List.generate((difference.toInt() ~/ chunkSize), (index) => chunkSize),
//     difference.toInt() % chunkSize,
//   ];

//   final random = integerChunks.fold<BigInt>(BigInt.zero, (sum, integerChunk) {
//     final randomIntegerChunk = randomInt(integerChunk);
//     sum += BigInt.from(randomIntegerChunk);
//     return sum;
//   });

//   return random;
// }
