import 'package:fake_it/src/base/data_source.dart';
import 'package:fake_it/src/base/resources.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider.dart';

class FakeCollection {
  FakeCollection({
    required FakeItLocale locale,
    required List<DataSource> dataSources,
  })  : lorem = Lorem(locale),
        job = Job(locale),
        person = Person(locale),
        address = Address(locale),
        image = Image(locale),
        automotive = Automotive(locale),
        vehicle = Vehicle(locale),
        color = Color(locale),
        internet = Internet(locale),
        animal = Animal(locale),
        location = Location(locale) {
    for (var dataSource in dataSources) {
      registerDataSource(dataSource.copyWith(locale: locale));
    }
  }

  final Lorem lorem;
  final Job job;
  final Person person;
  final Address address;
  final Image image;
  final Automotive automotive;
  final Vehicle vehicle;
  final Color color;
  final Internet internet;
  final Animal animal;
  final Location location;
}
