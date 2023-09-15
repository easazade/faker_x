import 'package:faker_x/src/base/base.dart';

class ParagraphArgs {
  final int maxSentences;

  ParagraphArgs({this.maxSentences = 1});
}

final paragraph = StringDataSource<ParagraphArgs>.withBuilder(
  dataKey: DataKeys.paragraph,
  locale: Locales.en_us,
  builder: (ParagraphArgs args, FakerXLocale locale) {
    final sentenceCount = randomInt(args.maxSentences);
    return List.generate(
      sentenceCount,
      (_) => provide(DataKeys.sentence, locale),
    ).join('. ');
  },
);
