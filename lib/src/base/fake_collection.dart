/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make
/// to this file will be removed when code generation takes effect.
///
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

import 'package:faker_x/src/base/data_source.dart';
import 'package:faker_x/src/base/numbers.dart';
import 'package:faker_x/src/base/resources.dart';
import 'package:faker_x/src/base/locale.dart';
import 'package:faker_x/src/base/provider.dart';

class FakeCollection {
  FakeCollection({
    required FakerXLocale locale,
    required List<DataSource> dataSources,
  })  : number = Numbers(),
        address = Address(locale),
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

  final Numbers number;
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
