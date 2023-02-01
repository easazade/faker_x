import 'dart:math';

import 'package:fake_it/src/base/base.dart';

class ImageArgs {
  final int width;
  final int height;
  final List<String> keywords;

  ImageArgs(this.width, this.height, this.keywords);
}

const image = DataSource(
  dataKey: DataKeys.image,
  locale: Locales.en_us,
  formats: [],
  values: [
    'https://pexels.com/imageurl1.png',
    'https://pexels.com/imageurl2.png',
    'https://pexels.com/imageurl3.png',
    'https://pexels.com/imageurl4.png',
    'https://pexels.com/imageurl5.png',
    'https://pexels.com/imageurl6.png',
    'https://pexels.com/imageurl7.png',
    'https://pexels.com/imageurl8.png',
    'https://pexels.com/imageurl9.png',
    'https://pexels.com/imageurl10.png',
  ],
);

final image_custom = DataSource<ImageArgs>.withBuilder(
  dataKey: DataKeys.image_custom,
  locale: Locales.en_us,
  builder: (ImageArgs args) {
    return _imageUrl(args.width, args.height, args.keywords);
  },
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
