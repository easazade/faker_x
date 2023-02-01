import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/image.dart';
import 'package:test/test.dart';

void main() {
  test('description', () {
    final image_custom = DataSource.withBuilder(
      dataKey: DataKeys.image_custom,
      locale: Locales.en_us,
      builder: (ImageArgs args) => 'genrated link',
    );
    print(image_custom.builder!.call(ImageArgs(340, 440, ['awd'])));
    print(image_custom.formats);
    print(image_custom.values);
    print(image_custom.dataKey);
    print(image_custom.locale);
  });
}
