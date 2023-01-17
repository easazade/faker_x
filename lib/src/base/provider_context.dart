import 'package:fake_it/src/base/locale.dart';

class ProviderContext {
  ProviderContext({
    required this.key,
    required this.locale,
    this.previousContext,
  });

  final String key;
  final FakeItLocale locale;
  final ProviderContext? previousContext;

  bool get hasDuplicateKeyWithPreviousContexts {
    var context = previousContext;
    while (context != null) {
      if (context.key == key) return true;
      context = context.previousContext;
    }
    return false;
  }
}
