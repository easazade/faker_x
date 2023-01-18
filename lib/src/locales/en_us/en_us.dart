import 'package:fake_it/src/base/base.dart';
import 'package:fake_it/src/locales/en_us/datasources/address.dart';
import 'package:fake_it/src/locales/en_us/datasources/job.dart';
import 'package:fake_it/src/locales/en_us/datasources/lorem.dart';
import 'package:fake_it/src/locales/en_us/datasources/person.dart';

export 'datasources/address.dart';
export 'datasources/car.dart';
export 'datasources/color.dart';
export 'datasources/country.dart';
export 'datasources/currency.dart';
export 'datasources/job.dart';
export 'datasources/lorem.dart';

class EnUsCollection extends FakeCollection {
  EnUsCollection()
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
