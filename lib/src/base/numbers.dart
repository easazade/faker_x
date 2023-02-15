import 'package:faker_x/src/base/utils.dart' as utils;

class Numbers {
  const Numbers();

  int fixDigits(digits) => int.parse(List.generate(digits, (index) {
        if (index == 0) {
          return utils.randomNonZeroInt(10);
        } else {
          return utils.randomInt(10);
        }
      }).join());

  /// you can use string patterns like '##.#####' to generate doubles
  ///
  ///
  ///
  /// eg pattern can generate numbers like below
  /// ###.##### => 289.12309
  /// 0.## => 0.44 , 0.34 , 0.01
  /// 1.0# => 1.01 , 1.04 , 1.09
  ///
  double doubleFromPattern(String pattern) {
    final charList = <dynamic>[];

    for (var i = 0; i < pattern.length; i++) {
      final char = pattern[i];
      if (char == '#') {
        if (i == 0) {
          if (pattern.length > 1 && pattern[1] == '.') {
            charList.add(utils.randomOneDigitInt);
          } else {
            charList.add(utils.randomOneDigitNonZeroInt);
          }
        } else {
          charList.add(utils.randomOneDigitInt);
        }
      } else {
        charList.add(char);
      }
    }

    return double.parse(charList.join());
  }

  /// you can use string patterns like '##.#####' to generate doubles
  ///
  ///
  ///
  /// eg pattern can generate numbers like below
  /// #### => 1000
  /// # => 9
  /// ## => 38
  ///
  int intFromPattern(String pattern) => doubleFromPattern(pattern).toInt();

  int randomInt(int max, {int min = 0}) => utils.randomInt(max, min: min);

  int get randomOneDigitInt => utils.randomOneDigitInt;

  int get randomOneDigitNonZeroInt => utils.randomOneDigitNonZeroInt;

  int randomNonZeroInt(int max) => utils.randomNonZeroInt(max);

  double randomDouble({num range = 1, num min = 0}) =>
      utils.randomDouble(range: range, min: min);
}
