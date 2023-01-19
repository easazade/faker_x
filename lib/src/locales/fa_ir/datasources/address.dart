import 'package:fake_it/src/base/base.dart';

const city_names = DataSource(
  dataKey: DataKeys.city_names,
  locale: Locales.fa_ir,
  formats: [],
  values: [],
);

const street_names = DataSource(
  dataKey: DataKeys.street_names,
  locale: Locales.fa_ir,
  formats: [
    Format(
      '{{${DataKeys.street_prefixes}}} {{${DataKeys.last_names}}}',
      chance: 20,
    ),
    Format(
      '{{${DataKeys.last_names}}} {{${DataKeys.street_suffixes}}}',
      chance: 4,
    ),
  ],
  values: [],
);

const street_suffixes = DataSource(
  dataKey: DataKeys.street_suffixes,
  locale: Locales.fa_ir,
  values: [
    'شمالی',
    'غربی',
    'شرقی',
    'جنوبی',
    'اول',
    'دوم',
    'سوم',
    'چهارم',
    'پنجم',
    'ششم',
    'هفتم',
    'هشتم',
    'نهم',
    'دهم',
  ],
);

const street_prefixes = DataSource(
  dataKey: DataKeys.street_prefixes,
  locale: Locales.fa_ir,
  values: ['خیابان', 'کمربندی', 'بزرگراه'],
);

const states = DataSource(
  dataKey: DataKeys.states,
  locale: Locales.fa_ir,
  values: [
    'آذربایجان شرقی',
    'آذربایجان غربی',
    'اردبیل',
    'خراسان',
    'کردستان',
    'گیلان',
    'اصفهان',
    'البرز',
    'ایلام',
    'بوشهر',
    'تهران',
    'چهارمحال و بختیاری',
    'خراسان جنوبی',
    'خراسان رضوی',
    'خراسان شمالی',
    'خوزستان',
    'زنجان',
    'سمنان',
    'سیستان و بلوچستان',
    'فارس',
    'قزوین',
    'قم',
    'کرمان',
    'کرمانشاه',
    'کهگیلویه و بویراحمد',
    'گلستان',
    'لرستان',
    'مازندران',
    'مرکزی',
    'هرمزگان',
    'همدان',
    'یزد',
  ],
);

const postcodes = DataSource(
  dataKey: DataKeys.postcodes,
  locale: Locales.fa_ir,
  formats: [Format('##########')],
  values: [],
);

const building_names = DataSource(
  dataKey: DataKeys.building_names,
  locale: Locales.fa_ir,
  formats: [
    Format('{{${DataKeys.first_names}}}', chance: 20),
    Format('{{${DataKeys.first_names}}} #', chance: 4),
  ],
  values: [],
);

const addresses = DataSource(
  dataKey: DataKeys.addresses,
  locale: Locales.fa_ir,
  formats: [
    Format(
      '{{${DataKeys.city_names}}}, {{${DataKeys.street_names}}}, {{${DataKeys.alleys}}}, {{${DataKeys.building_names}}}, طبقه #, واحد #',
    ),
    Format(
      '{{${DataKeys.city_names}}}, {{${DataKeys.street_names}}}, {{${DataKeys.alleys}}}, پلاک ##',
    ),
  ],
  values: [],
);

const alleys = DataSource(
  dataKey: DataKeys.alleys,
  locale: Locales.fa_ir,
  formats: [
    Format('کوچه {{${DataKeys.first_names}}} #', chance: 4),
    Format('کوچه {{${DataKeys.first_names}}}', chance: 20),
    Format('محله {{${DataKeys.last_names}}}', chance: 3),
    Format('شهرک {{${DataKeys.last_names}}}', chance: 3),
  ],
  values: [],
);
