import 'package:fake_it/fake_it.dart';
import 'random_generator.dart';

class Conference {
  const Conference(this.random, this.dataProvider);
  final ConferenceDataProvider dataProvider;
  final RandomGenerator random;

  /// Generates a conference name.
  ///
  /// Example:
  /// ```dart
  ///   faker.conference.name();
  /// ```
  String name() => random.element(dataProvider.conferences());
}
