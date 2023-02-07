import 'dart:math' as math;

const _letters = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

final _random = math.Random();

int get randomOneDigitInt => _random.nextInt(10);

String get randomLetter => _letters[_random.nextInt(_letters.length)];

T coinToss<T>(T object1, T object2) =>
    (_random.nextInt(100) > 50) ? object1 : object2;

extension ListExt<T> on Iterable<T> {
  T? get randomItem {
    if (length == 0) return null;
    return elementAt(_random.nextInt(length));
  }
}

extension StringExt on String {
  bool get isBlank => trim().isEmpty;
}

