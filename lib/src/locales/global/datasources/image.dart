import 'dart:math';

import 'package:fake_it/src/base/base.dart';

class ImageArgs extends BaseArgs {
  final int width;
  final int height;
  final List<String> keywords;

  ImageArgs(this.width, this.height, this.keywords);
}

final image = DataSource<ImageArgs>.builder(
  dataKey: DataKeys.image,
  locale: Locales.en_us,
  builder: (ImageArgs args) =>
      _imageUrl(args.width, args.height, args.keywords),
);

String _imageUrl(int width, int height, List<String> keywords) {
  var url = 'https://source.unsplash.com';

  url += '/${width}x$height';

  if (keywords.isNotEmpty) {
    var keywordFormat =
        RegExp(r'^([A-Za-z0-9].+,[A-Za-z0-9]+)$|^([A-Za-z0-9]+)$');
    if (keywords.any(keywordFormat.hasMatch)) {
      url += '?${keywords.join(',')}';
      url = url += '&random=${Random().nextInt(100) + 1}';
    }
  } else {
    url = url += '?random=${Random().nextInt(100) + 1}';
  }
  return url;
}
