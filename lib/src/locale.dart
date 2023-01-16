const kDefaultFakeItLocale = FakeItLocale('en', 'US');

class FakeItLocale {
  final String languageCode;
  final String countryCode;

  const FakeItLocale(this.languageCode, this.countryCode);
}
