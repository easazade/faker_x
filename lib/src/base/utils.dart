import 'dart:math' as math;

final _random = math.Random();

int get randomOneDigitInt => _random.nextInt(10);

T coinToss<T>(T object1, T object2) =>
    (_random.nextInt(100) > 50) ? object1 : object2;

extension ListExt<T> on Iterable<T> {
  T get randomItem {
    if (length == 0) {
      throw Exception(
        'Cannot return random item from an Iterable that has no items',
      );
    }

    return elementAt(_random.nextInt(length));
  }
}

extension StringExt on String {
  bool get isBlank => trim().isEmpty;
}
