import 'dart:math' as math;

import 'package:faker_x/src/base/base.dart';

const _letters = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
const _lettersAndNumbers =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

final _random = math.Random();

int get randomOneDigitInt => _random.nextInt(10);
int get randomOneDigitNonZeroInt => randomInt(10, min: 1);

int randomNonZeroInt(int max) => randomInt(max, min: 1);

int randomInt(int max, {int min = 0}) {
  if (min > max) {
    throw Exception('min cannot be greater than max');
  }
  return min + _random.nextInt(max - min);
}

double randomDouble({num range = 1, num min = 0}) =>
    _random.nextDouble() * range + min;

String get randomLetter => _letters[_random.nextInt(_letters.length)];

String get randomLetterOrNumber =>
    _lettersAndNumbers[_random.nextInt(_lettersAndNumbers.length)];

String randomString(int length) =>
    List.generate(length, (index) => randomLetterOrNumber).join();

T coinToss<T>(T object1, T object2) =>
    (_random.nextInt(100) > 50) ? object1 : object2;

extension ListExt<T> on Iterable<T> {
  T? get randomItem {
    if (length == 0) return null;
    return elementAt(_random.nextInt(length));
  }
}

extension FormatListExt on List<Format> {
  Format? get randomFormatBaseOnChance {
    if (isEmpty) return null;

    final chances = <int>[];
    for (var i = 0; i < length; i++) {
      final format = this[i];
      chances.addAll(List.filled(format.chance, i));
    }

    final randomIndex = chances.randomItem!;
    return this[randomIndex];
  }
}

extension FormatIterableExt on Iterable<Format> {
  Format? get randomFormatBaseOnChance => toList().randomFormatBaseOnChance;
}

extension StringExt on String {
  bool get isBlank => trim().isEmpty;
  bool get isNotBlank => !isBlank;
}
