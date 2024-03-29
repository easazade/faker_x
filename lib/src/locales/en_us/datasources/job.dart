import 'package:faker_x/src/base/base.dart';

const job_prefix = StringDataSource(
  locale: Locales.en_us,
  dataKey: DataKeys.job_prefix,
  values: [
    'Lead',
    'Senior',
    'Direct',
    'Corporate',
    'Dynamic',
    'Future',
    'Product',
    'National',
    'Regional',
    'District',
    'Central',
    'Global',
    'Customer',
    'Investor',
    'Dynamic',
    'International',
    'Legacy',
    'Forward',
    'Internal',
    'Human',
    'Chief',
    'Principal',
  ],
);

const job_suffix = StringDataSource(
  locale: Locales.en_us,
  dataKey: DataKeys.job_suffix,
  values: [
    'Supervisor',
    'Associate',
    'Executive',
    'Liason',
    'Officer',
    'Manager',
    'Engineer',
    'Specialist',
    'Director',
    'Coordinator',
    'Administrator',
    'Architect',
    'Analyst',
    'Designer',
    'Planner',
    'Orchestrator',
    'Technician',
    'Developer',
    'Producer',
    'Consultant',
    'Assistant',
    'Facilitator',
    'Agent',
    'Representative',
    'Strategist',
  ],
);

const job_title = StringDataSource(
  locale: Locales.en_us,
  dataKey: DataKeys.job_title,
  formats: [
    Format(
        '{{${DataKeys.job_prefix}}} {{${DataKeys.job_title}}} {{${DataKeys.job_suffix}}}'),
    Format('{{${DataKeys.job_prefix}}} {{${DataKeys.job_title}}}'),
    Format('{{${DataKeys.job_title}}} {{${DataKeys.job_suffix}}}'),
  ],
  values: [
    'Supervisor',
    'Associate',
    'Executive',
    'Liason',
    'Officer',
    'Manager',
    'Engineer',
    'Specialist',
    'Director',
    'Coordinator',
    'Administrator',
    'Architect',
    'Analyst',
    'Designer',
    'Planner',
    'Orchestrator',
    'Technician',
    'Developer',
    'Producer',
    'Consultant',
    'Assistant',
    'Facilitator',
    'Agent',
    'Representative',
    'Strategist',
  ],
);
