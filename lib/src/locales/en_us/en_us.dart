import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/en_us/datasources/address.dart';
import 'package:fake_it/src/locales/en_us/datasources/job.dart';
import 'package:fake_it/src/locales/en_us/datasources/person.dart';
import 'package:fake_it/src/locales/en_us/datasources/lorem.dart';

class EnUsCollection extends FakeCollection {
  EnUsCollection()
      : super(
          locale: Locales.en_us,
          dataSources: [
            state_abbr,
            state,
            address,
            city_name,
            neighborhood,
            building_number,
            city_suffix,
            street_suffix,
            street_address,
            postcode,
            street_name,
            postcode_format,
            city_prefix,
            secondary_address,
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
