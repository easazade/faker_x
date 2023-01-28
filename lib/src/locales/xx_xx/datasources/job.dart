import 'package:fake_it/src/base/base.dart';

const job_prefixes = DataSource(
  locale: Locales.xx_xx,
  dataKey: DataKeys.job_prefixes,
  values: [],
);

const job_suffixes = DataSource(
  locale: Locales.xx_xx,
  dataKey: DataKeys.job_suffixes,
  values: [],
);

const job_titles = DataSource(
  locale: Locales.xx_xx,
  dataKey: DataKeys.job_titles,
  formats: [
    Format(
        '{{${DataKeys.job_prefixes}}} {{${DataKeys.job_titles}}} {{${DataKeys.job_suffixes}}}'),
    Format('{{${DataKeys.job_prefixes}}} {{${DataKeys.job_titles}}}'),
    Format('{{${DataKeys.job_titles}}} {{${DataKeys.job_suffixes}}}'),
  ],
  values: [],
);
