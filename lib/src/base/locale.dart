const kDefaultFakerXLocale = Locales.en_us;

class Locales {
  static const fa_ir = FakerXLocale('fa', 'ir');
  static const en_us = FakerXLocale('en', 'us');
}

class FakerXLocale {
  final String languageCode;
  final String countryCode;

  const FakerXLocale(this.languageCode, this.countryCode);

  @override
  bool operator ==(Object other) =>
      other is FakerXLocale &&
      other.languageCode == languageCode &&
      other.countryCode == countryCode;

  @override
  int get hashCode => languageCode.hashCode + countryCode.hashCode;

  @override
  String toString() => '${languageCode}_$countryCode';

  static FakerXLocale fromString(String locale) {
    final splits = locale.split('_');
    return FakerXLocale(splits[0], splits.length > 1 ? splits[1] : '');
  }
}
