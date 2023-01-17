import 'package:fake_it/src/base/base.dart';

final en_us_job_prefixes = DataSource(
  locale: Locales.en_us,
  key: Keys.jobPrefixes,
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

final en_us_job_suffixes = DataSource(
  locale: Locales.en_us,
  key: Keys.jobSuffixes,
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

final en_us_job_titles = DataSource(
  locale: Locales.en_us,
  key: Keys.jobTitles,
  formats: [
    Format(
        '{{${Keys.jobPrefixes}}} {{${Keys.jobTitles}}} {{${Keys.jobSuffixes}}}'),
    Format('{{${Keys.jobPrefixes}}} {{${Keys.jobTitles}}}'),
    Format('{{${Keys.jobTitles}}} {{${Keys.jobSuffixes}}}'),
  ],
  values: [
    //TODO: these job titles should be changed.
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