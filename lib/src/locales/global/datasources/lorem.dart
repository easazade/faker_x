import 'package:faker_x/src/base/base.dart';

class ParagraphArgs {
  final int maxSentences;

  ParagraphArgs({
    @nonNullable required this.maxSentences,
  });
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
