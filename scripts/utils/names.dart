import 'package:recase/recase.dart';

const fakeItClassName = 'FakeIt';
const assertFunctionName = 'assertFakeValue';
const testRepeatCountVarName = 'testRepeatCount';

const resourcesAddress = 'lib/src/base/resources.dart';

String createCollectionClassName(String locale) =>
    '${ReCase(locale).pascalCase}Collection';
