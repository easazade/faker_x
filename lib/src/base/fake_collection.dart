import 'package:fake_it/src/base/data_source.dart';
import 'package:fake_it/src/base/resources.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider.dart';

class FakeCollection {
  FakeCollection({
    required FakeItLocale locale,
    required List<DataSource> dataSources,
  })  : address = Address(locale),
        animal = Animal(locale),
        color = Color(locale),
        person = Person(locale),
        location = Location(locale),
        vehicle = Vehicle(locale),
        job = Job(locale),
        automotive = Automotive(locale),
        internet = Internet(locale),
        lorem = Lorem(locale),
        phone = Phone(locale) {
    for (var dataSource in dataSources) {
      registerDataSource(dataSource.copyWith(locale: locale));
    }
  }

  final Address address;
  final Animal animal;
  final Color color;
  final Person person;
  final Location location;
  final Vehicle vehicle;
  final Job job;
  final Automotive automotive;
  final Internet internet;
  final Lorem lorem;
  final Phone phone;
}
