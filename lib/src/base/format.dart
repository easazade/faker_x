import 'package:fake_it/src/base/utils.dart';

class Format {
  final String format;
  final int chance;

  const Format(this.format, {this.chance = -1});

  List<String> get keys {
    final regex = RegExp('{{(.*?)}}', caseSensitive: false);
    final matches = regex.allMatches(format);

    return matches
        .map((e) => e.group(1))
        .where((element) => element != null)
        .map((e) => e!)
        .toList();
  }

  String parse(List<String> values) {
    final _format = format.replaceAllMapped('#', (_) => randomOneDigitInt.toString());

    final regex = RegExp('{{(.*?)}}', caseSensitive: false);
    final keysWithBraces = regex
        .allMatches(_format)
        .map((e) => e.group(0))
        .where((element) => element != null)
        .map((e) => e!)
        .toList();

    String parsedString = _format;
    for (var i = 0; i < keysWithBraces.length; i++) {
      parsedString = parsedString.replaceFirst(keysWithBraces[i], values[i]);
    }
    return parsedString;
  }
}
