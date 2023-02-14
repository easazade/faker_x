import 'package:fake_it/src/base/base.dart';

final color_hex = StringDataSource.withBuilder(
  dataKey: DataKeys.color_hex,
  locale: Locales.en_us,
  builder: (_, __) =>
      List<String>.generate(3, (index) => randomInt(256).toRadixString(16))
          .join(),
);
