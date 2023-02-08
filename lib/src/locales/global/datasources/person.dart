import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/en_us/datasources/person.dart' as person;

final first_name_en =
    person.first_name.copyWith(dataKey: DataKeys.first_name_en);

final last_name_en = person.last_name.copyWith(dataKey: DataKeys.last_name_en);
