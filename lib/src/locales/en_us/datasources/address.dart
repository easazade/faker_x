import 'package:faker_x/src/base/base.dart';

const city_suffix = StringDataSource(
  dataKey: DataKeys.city_suffix,
  locale: Locales.en_us,
  values: [
    'town',
    'ton',
    'land',
    'ville',
    'berg',
    'burgh',
    'borough',
    'bury',
    'view',
    'port',
    'mouth',
    'stad',
    'furt',
    'chester',
    'mouth',
    'fort',
    'haven',
    'side',
    'shire',
  ],
);

const city_prefix = StringDataSource(
  dataKey: DataKeys.city_prefix,
  locale: Locales.en_us,
  values: ['North', 'East', 'West', 'South', 'New', 'Lake', 'Port'],
);

const city_name = StringDataSource(
  dataKey: DataKeys.city_name,
  locale: Locales.en_us,
  formats: [
    Format(
        '{{${DataKeys.city_prefix}}} {{${DataKeys.first_name}}}{{${DataKeys.city_suffix}}}'),
    Format('{{${DataKeys.city_prefix}}} {{${DataKeys.first_name}}}'),
    Format('{{${DataKeys.first_name}}}{{${DataKeys.city_suffix}}}'),
    Format('{{${DataKeys.last_name}}}{{${DataKeys.city_suffix}}}'),
  ],
  values: [],
);

const street_name = StringDataSource(
  dataKey: DataKeys.street_name,
  locale: Locales.en_us,
  formats: [
    Format('{{${DataKeys.first_name}}} {{${DataKeys.street_suffix}}}'),
    Format('{{${DataKeys.last_name}}} {{${DataKeys.street_suffix}}}'),
  ],
  values: [],
);

const street_suffix = StringDataSource(
  dataKey: DataKeys.street_suffix,
  locale: Locales.en_us,
  values: [
    'Alley',
    'Avenue',
    'Branch',
    'Bridge',
    'Brook',
    'Brooks',
    'Burg',
    'Burgs',
    'Bypass',
    'Camp',
    'Canyon',
    'Cape',
    'Causeway',
    'Center',
    'Centers',
    'Circle',
    'Circles',
    'Cliff',
    'Cliffs',
    'Club',
    'Common',
    'Corner',
    'Corners',
    'Course',
    'Court',
    'Courts',
    'Cove',
    'Coves',
    'Creek',
    'Crescent',
    'Crest',
    'Crossing',
    'Crossroad',
    'Curve',
    'Dale',
    'Dam',
    'Divide',
    'Drive',
    'Drive',
    'Drives',
    'Estate',
    'Estates',
    'Expressway',
    'Extension',
    'Extensions',
    'Fall',
    'Falls',
    'Ferry',
    'Field',
    'Fields',
    'Flat',
    'Flats',
    'Ford',
    'Fords',
    'Forest',
    'Forge',
    'Forges',
    'Fork',
    'Forks',
    'Fort',
    'Freeway',
    'Garden',
    'Gardens',
    'Gateway',
    'Glen',
    'Glens',
    'Green',
    'Greens',
    'Grove',
    'Groves',
    'Harbor',
    'Harbors',
    'Haven',
    'Heights',
    'Highway',
    'Hill',
    'Hills',
    'Hollow',
    'Inlet',
    'Inlet',
    'Island',
    'Island',
    'Islands',
    'Islands',
    'Isle',
    'Isle',
    'Junction',
    'Junctions',
    'Key',
    'Keys',
    'Knoll',
    'Knolls',
    'Lake',
    'Lakes',
    'Land',
    'Landing',
    'Lane',
    'Light',
    'Lights',
    'Loaf',
    'Lock',
    'Locks',
    'Locks',
    'Lodge',
    'Lodge',
    'Loop',
    'Mall',
    'Manor',
    'Manors',
    'Meadow',
    'Meadows',
    'Mews',
    'Mill',
    'Mills',
    'Mission',
    'Mission',
    'Motorway',
    'Mount',
    'Mountain',
    'Mountain',
    'Mountains',
    'Mountains',
    'Neck',
    'Orchard',
    'Oval',
    'Overpass',
    'Park',
    'Parks',
    'Parkway',
    'Parkways',
    'Pass',
    'Passage',
    'Path',
    'Pike',
    'Pine',
    'Pines',
    'Place',
    'Plain',
    'Plains',
    'Plains',
    'Plaza',
    'Plaza',
    'Point',
    'Points',
    'Port',
    'Port',
    'Ports',
    'Ports',
    'Prairie',
    'Prairie',
    'Radial',
    'Ramp',
    'Ranch',
    'Rapid',
    'Rapids',
    'Rest',
    'Ridge',
    'Ridges',
    'River',
    'Road',
    'Road',
    'Roads',
    'Roads',
    'Route',
    'Row',
    'Rue',
    'Run',
    'Shoal',
    'Shoals',
    'Shore',
    'Shores',
    'Skyway',
    'Spring',
    'Springs',
    'Springs',
    'Spur',
    'Spurs',
    'Square',
    'Square',
    'Squares',
    'Squares',
    'Station',
    'Station',
    'Stravenue',
    'Stravenue',
    'Stream',
    'Stream',
    'Street',
    'Street',
    'Streets',
    'Summit',
    'Summit',
    'Terrace',
    'Throughway',
    'Trace',
    'Track',
    'Trafficway',
    'Trail',
    'Trail',
    'Tunnel',
    'Tunnel',
    'Turnpike',
    'Turnpike',
    'Underpass',
    'Union',
    'Unions',
    'Valley',
    'Valleys',
    'Via',
    'Viaduct',
    'View',
    'Views',
    'Village',
    'Village',
    'Villages',
    'Ville',
    'Vista',
    'Vista',
    'Walk',
    'Walks',
    'Wall',
    'Way',
    'Ways',
    'Well',
    'Wells',
  ],
);

const state = StringDataSource(
  dataKey: DataKeys.state,
  locale: Locales.en_us,
  values: [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming',
  ],
);

const postcode_format = StringDataSource(
  dataKey: DataKeys.postcode_format,
  locale: Locales.en_us,
  formats: [Format('#####-####'), Format('#####')],
  values: [],
);

const postcode = StringDataSource(
  dataKey: DataKeys.postcode,
  locale: Locales.en_us,
  formats: [Format('#####')],
  values: [],
);

const secondary_address = StringDataSource(
  dataKey: DataKeys.secondary_address,
  locale: Locales.en_us,
  formats: [Format('Apt. ###'), Format('Suite ###')],
  values: [],
);

const building_number = StringDataSource(
  dataKey: DataKeys.building_number,
  locale: Locales.en_us,
  formats: [Format('###'), Format('####'), Format('#####')],
  values: [],
);

const street_address = StringDataSource(
  dataKey: DataKeys.street_address,
  locale: Locales.en_us,
  formats: [
    Format('{{${DataKeys.building_number}}} {{${DataKeys.street_name}}}'),
    Format(
      '{{${DataKeys.building_number}}} {{${DataKeys.street_name}}} {{${DataKeys.secondary_address}}}',
    ),
  ],
  values: [],
);

const address = StringDataSource(
  dataKey: DataKeys.address,
  locale: Locales.en_us,
  formats: [
    Format(
      '{{${DataKeys.street_address}}}\n{{${DataKeys.city_name}}}, {{${DataKeys.state_abbr}}} {{${DataKeys.postcode}}}',
    ),
  ],
  values: [],
);

const state_abbr = StringDataSource(
  dataKey: DataKeys.state_abbr,
  locale: Locales.en_us,
  formats: [],
  values: [
    'AL',
    'AK',
    'AZ',
    'AR',
    'CA',
    'CO',
    'CT',
    'DE',
    'DC',
    'FL',
    'GA',
    'HI',
    'ID',
    'IL',
    'IN',
    'IA',
    'KS',
    'KY',
    'LA',
    'ME',
    'MD',
    'MA',
    'MI',
    'MN',
    'MS',
    'MO',
    'MT',
    'NE',
    'NV',
    'NH',
    'NJ',
    'NM',
    'NY',
    'NC',
    'ND',
    'OH',
    'OK',
    'OR',
    'PA',
    'RI',
    'SC',
    'SD',
    'TN',
    'TX',
    'UT',
    'VT',
    'VA',
    'WA',
    'WV',
    'WI',
    'WY',
  ],
);

const neighborhood = StringDataSource(
  dataKey: DataKeys.neighborhood,
  locale: Locales.en_us,
  values: [
    'East of Telegraph Road',
    'North Norridge',
    'Northwest Midlothian/Midlothian Country Club',
    'Mott Haven/Port Morris',
    'Kingsbridge Heights',
    'Bronxdale',
    'Pennypack',
    'Bridesburg',
    'Allegheny West',
    'Bushwick South',
    'Dyker Heights',
    'Ocean Parkway South',
    'Summerlin North',
    'Seven Hills Area',
    'Greater Las Vegas National',
    'phoenix',
    'Central Chandler',
    'South of Bell Road',
    'River Heights',
    'White Plains Central',
    'Mount Kisco West',
    'Pound Ridge East',
    'Babylon Bayside',
    'Sagaponack Seaside',
    'South of Lake Ave',
    'Far Rockaway/Bayswater',
    'Jamaica Estates/Holliswood',
    'Murray Hill',
    'East Renton',
    'Renton West',
    'Auburn North',
    'Northwoods West',
    'Florissant West',
    'Ladue South',
    'Candlewood Country Club',
    'West Covina East',
    'North East Irwindale',
    'Sunshine-Gardens',
    'Cipriani',
    'Brentwood Central',
    'Jupiter South/Abacoa',
    'Sea Ranch Lakes',
    'Schall Circle/Lakeside Green',
    'Olmsted Falls Central',
    'South of Lake Shore Blvd',
    'Gates Mills North',
    'White Oak South of Columbia Pike',
    'Rockville East of Hungerford Dr',
    'Cleveland Park',
  ],
);
