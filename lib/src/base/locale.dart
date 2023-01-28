const kDefaultFakeItLocale = Locales.en_us;

class Locales {
  static const fa_ir = FakeItLocale('fa', 'ir');
  static const en_us = FakeItLocale('en', 'us');
}

class FakeItLocale {
  final String languageCode;
  final String countryCode;

  const FakeItLocale(this.languageCode, this.countryCode);

  @override
  bool operator ==(Object other) =>
      other is FakeItLocale &&
      other.languageCode == languageCode &&
      other.countryCode == countryCode;

  @override
  int get hashCode => languageCode.hashCode + countryCode.hashCode;

  @override
  String toString() => '${languageCode}_$countryCode';
}
