import 'package:fake_it/src/base/locale.dart';

class ProviderContext {
  ProviderContext({
    required this.dataKey,
    required this.locale,
    this.previousContext,
  });

  final String dataKey;
  final FakeItLocale locale;
  final ProviderContext? previousContext;

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
