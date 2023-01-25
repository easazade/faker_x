import 'package:recase/recase.dart';

const fakeItClassName = 'FakeIt';

String createCollectionClassName(String locale) =>
    '${ReCase(locale).pascalCase}Collection';
