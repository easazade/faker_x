export 'data_source.dart';
export 'faker_x_class.dart';
export 'format.dart';
export 'keys.dart';
export 'locale.dart';
export 'provider_context.dart';
export 'provider.dart';
export 'utils.dart';
export 'fake_collection.dart';
export 'resources.dart';
export 'types.dart';

class BaseResource {
  const BaseResource({this.isRequired = true});

  final bool isRequired;
}

const nonNullable = 'nonNullable';
