import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/address.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/job.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/lorem.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/person.dart';

class XxXxCollection extends FakeCollection {
  XxXxCollection()
      : super(
          locale: Locales.en_us,
          dataSources: [
            first_names,
            first_names_female,
            first_names_male,
            last_names,
            words,
            sentences,
            job_titles,
            job_suffixes,
            job_prefixes,
            city_suffixes,
            city_prefixes,
            city_names,
            street_suffixes,
            states,
            postcode_formats,
            addresses,
            neighborhoods,
            street_names,
            postcodes,
            street_addresses,
            states_abbr,
            building_numbers,
            secondary_addresses,
          ],
        );
}
