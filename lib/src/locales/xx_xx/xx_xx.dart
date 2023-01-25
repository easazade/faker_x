import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/address.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/job.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/lorem.dart';
import 'package:fake_it/src/locales/xx_xx/datasources/person.dart';

class XxXxCollection extends FakeCollection {
  XxXxCollection()
      : super(
          locale: Locales.xx_xx,
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
