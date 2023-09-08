/// !!!! DO NOT MODIFY BY HAND !!!!
///
/// This file is generated using scripts in scripts directory. any changes you make
/// to this file will be removed when code generation takes effect.
///
/// NOTE: Some part of some of the generated files are generated using mustache
/// templates in templates directory.

import 'package:faker_x/src/base/utility_resources/number.dart';
import 'package:faker_x/src/base/resources.dart';
import 'package:faker_x/src/base/locale.dart';
import 'package:faker_x/src/base/utility_resources/time.dart';

class FakeCollection {
  final FakerXLocale locale;

  FakeCollection({required this.locale})
      : number = Number(),
        time = Time(),
        address = Address(locale),
        animal = Animal(locale),
        automotive = Automotive(locale),
        color = Color(locale),
        internet = Internet(locale),
        job = Job(locale),
        location = Location(locale),
        lorem = Lorem(locale),
        person = Person(locale),
        phone = Phone(locale),
        vehicle = Vehicle(locale);

  final Number number;
  final Time time;
  final Address address;
  final Animal animal;
  final Automotive automotive;
  final Color color;
  final Internet internet;
  final Job job;
  final Location location;
  final Lorem lorem;
  final Person person;
  final Phone phone;
  final Vehicle vehicle;
}
