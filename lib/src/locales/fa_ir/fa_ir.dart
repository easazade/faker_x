import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/address.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/job.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/person.dart';
import 'package:fake_it/src/locales/fa_ir/datasources/lorem.dart';

class FaIrCollection extends FakeCollection {
  FaIrCollection()
      : super(
          locale: Locales.fa_ir,
          dataSources: [
            building_name,
            street_suffix,
            state,
            address,
            city_name,
            postcode,
            street_name,
            alley,
            street_prefix,
            job_suffix,
            job_title,
            job_prefix,
            first_name_male,
            full_name,
            first_name_female,
            last_name,
            first_name,
            sentence,
            word,
          ],
        );
}
