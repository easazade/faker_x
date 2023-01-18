import 'package:fake_it/src/base/data_source.dart';
import 'package:fake_it/src/base/defenitions.dart';
import 'package:fake_it/src/base/locale.dart';
import 'package:fake_it/src/base/provider.dart';

class FakeCollection {
  FakeCollection({
    required FakeItLocale locale,
    required List<DataSource> dataSources,
  })  : lorem = Lorem(locale),
        job = Job(locale) {
    for (var dataSource in dataSources) {
      registerDataSource(dataSource);
    }
  }

  final Lorem lorem;
  final Job job;

  final Extra extra = EmptyExtra();
}
