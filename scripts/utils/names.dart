import 'package:recase/recase.dart';

const fakeItClassName = 'FakeIt';
const assertFunctionName = 'assertFakeValue';

String createCollectionClassName(String locale) =>
    '${ReCase(locale).pascalCase}Collection';
