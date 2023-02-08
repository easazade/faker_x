import 'package:fake_it/src/base/utils.dart';

typedef StringTransformer = String Function(String);

class Format {
  const Format(this.format, {this.chance = -1, this.transformers = const []});

  final String format;
  final int chance;
  final List<StringTransformer> transformers;

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
    var _format =
        format.replaceAllMapped('#', (_) => randomOneDigitInt.toString());

    _format = _format.replaceAllMapped('?', (match) => randomLetter);

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
    for (var transformer in transformers) {
      parsedString = transformer(parsedString);
    }

    return parsedString;
  }

  Format copyWith({
    String? format,
    int? chance,
    List<StringTransformer>? transformers,
  }) =>
      Format(
        format ?? this.format,
        chance: chance ?? this.chance,
        transformers: transformers ?? this.transformers,
      );
}

class StringTransformers {
  StringTransformers._();

  static String toLowerCase(String string) => string.toLowerCase();

  static String toUpperCase(String string) => string.toUpperCase();
}
