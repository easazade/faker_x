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

String doNotModifyByHandHeader = '''
/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make 
/// to this file will be removed when code generation takes effect.
/// 
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.\n
''';
