import 'package:faker_x/src/base/locale.dart';

class ProvideContext {
  ProvideContext({
    required this.dataKey,
    required this.locale,
    this.previousContext,
  });

  final String dataKey;
  final FakerXLocale locale;
  final ProvideContext? previousContext;

  bool get hasDuplicateKeyWithPreviousContexts {
    var context = previousContext;
    while (context != null) {
      if (context.dataKey == dataKey) return true;
      context = context.previousContext;
    }
    return false;
  }

  @override
  String toString() => '{ dataKey:$dataKey'
      ', locale:$locale'
      ', \npreviousContext:$previousContext }';
}
