import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/en_us/datasources/address.dart';
import 'package:fake_it/src/locales/en_us/datasources/job.dart';
import 'package:fake_it/src/locales/en_us/datasources/lorem.dart';
import 'package:fake_it/src/locales/en_us/datasources/person.dart';

class EnUsCollection extends FakeCollection {
  EnUsCollection()
      : super(
          locale: Locales.en_us,
          dataSources: [
            city_suffixes,
            postcode_formats,
            states_abbr,
            secondary_addresses,
            street_names,
            city_names,
            street_addresses,
            street_suffixes,
            states,
            neighborhoods,
            building_numbers,
            city_prefixes,
            postcodes,
            addresses,
            job_prefixes,
            job_titles,
            job_suffixes,
            words,
            sentences,
            first_names,
            last_names,
            first_names_female,
            full_names,
            first_names_male,
          ],
        );
}
