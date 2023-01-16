const kDefaultFakeItLocale = FakeItLocale('en', 'US');

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
}
