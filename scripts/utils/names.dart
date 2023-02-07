import 'package:recase/recase.dart';

const fakeItClassName = 'FakeIt';
const assertFunctionName = 'assertFakeValue';
const testRepeatCountVarName = 'testRepeatCount';

String createCollectionClassName(String locale) =>
    '${ReCase(locale).pascalCase}Collection';
