import 'package:recase/recase.dart';

const assertFunctionName = 'assertFakeValue';
const testRepeatCountVarName = 'testRepeatCount';

const fakeItClassName = 'FakeIt';
const fakeCollectionClassName = 'FakeCollection';
const fakeItLocaleClassName = 'FakeItLocale';
const dataKeysClassName = 'DataKeys';
const dataSourceClassName = 'DataSource';

const resourcesAddress = 'lib/src/base/resources.dart';

String createCollectionClassName(String locale) =>
    '${ReCase(locale).pascalCase}Collection';
