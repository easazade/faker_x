import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/base/defenitions/job.dart';
import 'package:fake_it/src/base/defenitions/lorem.dart';

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
}
