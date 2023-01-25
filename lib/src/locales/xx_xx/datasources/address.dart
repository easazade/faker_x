import 'package:fake_it/src/base/base.dart';

const city_suffixes = DataSource(
  dataKey: DataKeys.city_suffixes,
  locale: Locales.xx_xx,
  values: [],
);

const city_prefixes = DataSource(
  dataKey: DataKeys.city_prefixes,
  locale: Locales.xx_xx,
  values: ['North', 'East', 'West', 'South', 'New', 'Lake', 'Port'],
);

const city_names = DataSource(
  dataKey: DataKeys.city_names,
  locale: Locales.xx_xx,
  formats: [
    Format(
        '{{${DataKeys.city_prefixes}}} {{${DataKeys.first_names}}}{{${DataKeys.city_suffixes}}}'),
    Format('{{${DataKeys.city_prefixes}}} {{${DataKeys.first_names}}}'),
    Format('{{${DataKeys.first_names}}}{{${DataKeys.city_suffixes}}}'),
    Format('{{${DataKeys.last_names}}}{{${DataKeys.city_suffixes}}}'),
  ],
  values: [],
);

const street_names = DataSource(
  dataKey: DataKeys.street_names,
  locale: Locales.xx_xx,
  formats: [
    Format('{{${DataKeys.first_names}}} {{${DataKeys.street_suffixes}}}'),
    Format('{{${DataKeys.last_names}}} {{${DataKeys.street_suffixes}}}'),
  ],
  values: [],
);

const street_suffixes = DataSource(
  dataKey: DataKeys.street_suffixes,
  locale: Locales.xx_xx,
  values: [],
);

const states = DataSource(
  dataKey: DataKeys.states,
  locale: Locales.xx_xx,
  values: [],
);

const postcode_formats = DataSource(
  dataKey: DataKeys.postcode_formats,
  locale: Locales.xx_xx,
  formats: [Format('#####-####'), Format('#####')],
  values: [],
);

const postcodes = DataSource(
  dataKey: DataKeys.postcodes,
  locale: Locales.xx_xx,
  formats: [Format('#####')],
  values: [],
);

const secondary_addresses = DataSource(
  dataKey: DataKeys.secondary_addresses,
  locale: Locales.xx_xx,
  formats: [Format('Apt. ###'), Format('Suite ###')],
  values: [],
);

const building_numbers = DataSource(
  dataKey: DataKeys.building_numbers,
  locale: Locales.xx_xx,
  formats: [Format('###'), Format('####'), Format('#####')],
  values: [],
);

const street_addresses = DataSource(
  dataKey: DataKeys.street_addresses,
  locale: Locales.xx_xx,
  formats: [
    Format('{{${DataKeys.building_numbers}}} {{${DataKeys.street_names}}}'),
    Format(
      '{{${DataKeys.building_numbers}}} {{${DataKeys.street_names}}} {{${DataKeys.secondary_addresses}}}',
    ),
  ],
  values: [],
);

const addresses = DataSource(
  dataKey: DataKeys.addresses,
  locale: Locales.xx_xx,
  formats: [
    Format(
      '{{${DataKeys.street_addresses}}}\n{{${DataKeys.city_names}}}, {{${DataKeys.states_abbr}}} {{${DataKeys.postcodes}}}',
    ),
  ],
  values: [],
);

const states_abbr = DataSource(
  dataKey: DataKeys.states_abbr,
  locale: Locales.xx_xx,
  formats: [],
  values: [],
);

const neighborhoods = DataSource(
  dataKey: DataKeys.neighborhoods,
  locale: Locales.xx_xx,
  values: [],
);
