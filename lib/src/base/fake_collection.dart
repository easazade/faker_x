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
        address = Address(locale) {
    for (var dataSource in dataSources) {
      registerDataSource(dataSource);
    }
  }

  final Lorem lorem;
  final Job job;
  final Person person;
  final Address address;

  final Extra extra = EmptyExtra();
}
