import 'package:recase/recase.dart';

const assertFunctionName = 'assertFakeValue';
const testRepeatCountVarName = 'testRepeatCount';

const fakerXClassName = 'FakerX';
const fakeCollectionClassName = 'FakeCollection';
const fakerXLocaleClassName = 'FakerXLocale';
const dataKeysClassName = 'DataKeys';
const stringDataSourceClassName = 'StringDataSource';
const dataSourceClassName = 'DataSource';
const argumentFieldAnnotationName = 'ArgumentField';

const resourcesAddress = 'lib/src/base/resources.dart';

String createCollectionClassName(String locale) =>
    '${ReCase(locale).pascalCase}Collection';
