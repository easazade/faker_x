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
}
