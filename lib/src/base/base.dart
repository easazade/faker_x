export 'data_source.dart';
export 'fake_it_class.dart';
export 'format.dart';
export 'keys.dart';
export 'locale.dart';
export 'provider_context.dart';
export 'provider.dart';
export 'utils.dart';
export 'fake_collection.dart';
export 'resources.dart';

class BaseResource {
  const BaseResource({required this.isRequired});

  final bool isRequired;
}

const nonNullable = 'isRequired';
