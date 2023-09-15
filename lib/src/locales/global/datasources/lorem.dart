import 'package:faker_x/src/base/base.dart';

class ParagraphArgs {
  final int maxSentences;
  final int minSentences;

  ParagraphArgs({this.maxSentences = 3, this.minSentences = 1});
}

final paragraph = StringDataSource<ParagraphArgs>.withBuilder(
  dataKey: DataKeys.paragraph,
  locale: Locales.en_us,
  builder: (ParagraphArgs args, FakerXLocale locale) {
    final sentenceCount = randomInt(args.maxSentences, min: args.minSentences);

    final sentences = List.generate(
      sentenceCount,
      (_) => provide(DataKeys.sentence, locale),
    );

    return sentences.join(' ');
  },
);
