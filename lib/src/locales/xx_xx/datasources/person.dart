import 'package:fake_it/src/base/base.dart';

const full_names = DataSource(
  dataKey: DataKeys.full_names,
  locale: Locales.xx_xx,
  formats: [
    Format('{{${DataKeys.first_names_female}}} {{${DataKeys.last_names}}}'),
    Format('{{${DataKeys.first_names_male}}} {{${DataKeys.last_names}}}'),
  ],
  values: [],
);

const first_names = DataSource(
  dataKey: DataKeys.first_names,
  locale: Locales.xx_xx,
  formats: [
    Format('{{${DataKeys.first_names_female}}}'),
    Format('{{${DataKeys.first_names_male}}}'),
  ],
  values: [],
);

const first_names_female = DataSource(
  dataKey: DataKeys.first_names_female,
  locale: Locales.xx_xx,
  values: [],
);

const first_names_male = DataSource(
  dataKey: DataKeys.first_names_male,
  locale: Locales.xx_xx,
  values: [],
);

const last_names = DataSource(
  dataKey: DataKeys.last_names,
  locale: Locales.xx_xx,
  formats: [],
  values: [],
);
