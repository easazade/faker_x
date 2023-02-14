import 'package:fake_it/src/base/base.dart';

class EmailArgs {
  final String? firstName;
  final String? lastName;
  final String? provider;

  EmailArgs({this.firstName, this.lastName, this.provider});
}

class UsernameArgs {
  final String? firstName;
  final String? lastName;

  UsernameArgs({this.firstName, this.lastName});
}

class UriArgs {
  final String protocol;

  UriArgs({@nonNullable required this.protocol});
}

class PasswordArgs {
  final int length;
  final bool onlyNumeric;

  PasswordArgs({this.length = 10, this.onlyNumeric = false});
}

const mail_provider = StringDataSource(
  dataKey: DataKeys.mail_provider,
  locale: Locales.en_us,
  values: [
    'gmail.com',
    'yahoo.com',
    'outlook.com',
    'hotmail.com',
  ],
);

const disposable_mail_provider = StringDataSource(
  dataKey: DataKeys.disposable_mail_provider,
  locale: Locales.en_us,
  values: [
    'mailinator.com',
    'suremail.info',
    'spamherelots.com',
    'binkmail.com',
    'safetymail.info'
  ],
);

final email_from = StringDataSource<EmailArgs>.withBuilder(
  dataKey: DataKeys.email_from,
  locale: Locales.en_us,
  builder: (EmailArgs args, FakeItLocale locale) {
    final userName = provide(
      DataKeys.user_name_from,
      locale,
      args: UsernameArgs(firstName: args.firstName, lastName: args.lastName),
    );

    final provider = args.provider ?? '{{${DataKeys.mail_provider}}}';

    return Format(
      '$userName@$provider',
      transformers: [StringTransformers.toLowerCase],
    );
  },
);

final email = StringDataSource(
  dataKey: DataKeys.email,
  locale: Locales.en_us,
  formats: [
    Format(
      '{{${DataKeys.user_name}}}@{{${DataKeys.mail_provider}}}',
      transformers: [StringTransformers.toLowerCase],
    ),
  ],
  values: [],
);

final safe_email = email.copyWith(dataKey: DataKeys.safe_email);

final user_name = StringDataSource.withBuilder(
  dataKey: DataKeys.user_name,
  locale: Locales.en_us,
  builder: (_, __) {
    return const [
      Format('{{${DataKeys.first_name_en}}}{{${DataKeys.last_name_en}}}'),
      Format('{{${DataKeys.first_name_en}}}_{{${DataKeys.last_name_en}}}'),
      Format('{{${DataKeys.first_name_en}}}_{{${DataKeys.last_name_en}}}#'),
      Format('{{${DataKeys.first_name_en}}}#_{{${DataKeys.last_name_en}}}'),
      Format('{{${DataKeys.first_name_en}}}'),
      Format('{{${DataKeys.first_name_en}}}#'),
      Format('{{${DataKeys.first_name_en}}}##'),
      Format('{{${DataKeys.first_name_en}}}_#'),
      Format('{{${DataKeys.last_name_en}}}'),
      Format('{{${DataKeys.last_name_en}}}#'),
      Format('{{${DataKeys.last_name_en}}}_#'),
      Format('{{${DataKeys.last_name_en}}}##'),
    ].randomItem!.copyWith(transformers: [StringTransformers.toLowerCase]);
  },
);

final user_name_from = StringDataSource<UsernameArgs>.withBuilder(
  dataKey: DataKeys.user_name_from,
  locale: Locales.en_us,
  builder: (UsernameArgs args, FakeItLocale locale) {
    final formats = <Format>[];

    if (args.firstName != null && args.lastName != null) {
      formats.addAll(
        [
          Format('${args.firstName}${args.lastName}'),
          Format('${args.firstName}_${args.lastName}'),
          Format('${args.firstName}_${args.lastName}#'),
          Format('${args.firstName}#_${args.lastName}'),
        ],
      );
    } else if (args.firstName != null) {
      formats.addAll(
        [
          Format('${args.firstName}'),
          Format('${args.firstName}#'),
          Format('${args.firstName}##'),
          Format('${args.firstName}_#'),
        ],
      );
    } else if (args.lastName != null) {
      formats.addAll(
        [
          Format('${args.lastName}'),
          Format('${args.lastName}#'),
          Format('${args.lastName}_#'),
          Format('${args.lastName}##'),
        ],
      );
    }

    if (formats.isEmpty) {
      formats.addAll([
        Format('{{${DataKeys.first_name_en}}}{{${DataKeys.last_name_en}}}'),
        Format('{{${DataKeys.first_name_en}}}_{{${DataKeys.last_name_en}}}'),
        Format('{{${DataKeys.first_name_en}}}_{{${DataKeys.last_name_en}}}#'),
        Format('{{${DataKeys.first_name_en}}}#_{{${DataKeys.last_name_en}}}'),
        Format('{{${DataKeys.first_name_en}}}'),
        Format('{{${DataKeys.first_name_en}}}#'),
        Format('{{${DataKeys.first_name_en}}}##'),
        Format('{{${DataKeys.first_name_en}}}_#'),
        Format('{{${DataKeys.last_name_en}}}'),
        Format('{{${DataKeys.last_name_en}}}#'),
        Format('{{${DataKeys.last_name_en}}}_#'),
        Format('{{${DataKeys.last_name_en}}}##'),
      ]);
    }
    return formats.randomItem;
  },
);

const domain_suffixes = StringDataSource(
  dataKey: DataKeys.domain_suffixes,
  locale: Locales.en_us,
  values: ['com', 'co.uk', 'gov', 'info', 'io', 'dev', 'tv'],
);

final domain_name = StringDataSource(
  dataKey: DataKeys.domain_name,
  locale: Locales.en_us,
  formats: [
    Format('{{${DataKeys.last_name_en}}}.{{${DataKeys.domain_suffixes}}}'),
  ],
  values: [],
);

final disposable_email = StringDataSource(
  dataKey: DataKeys.disposable_email,
  locale: Locales.en_us,
  formats: [
    Format(
      '{{${DataKeys.user_name}}}@{{${DataKeys.disposable_mail_provider}}}',
      transformers: [StringTransformers.toLowerCase],
    ),
  ],
  values: [],
);

final uri = StringDataSource<UriArgs>.withBuilder(
  dataKey: DataKeys.uri,
  locale: Locales.en_us,
  builder: (UriArgs args, _) {
    return Format('${args.protocol}://{{${DataKeys.domain_name}}}');
  },
);

final http_url = StringDataSource.withBuilder(
  dataKey: DataKeys.http_url,
  locale: Locales.en_us,
  builder: (_, __) {
    return uri.build(UriArgs(protocol: 'http'));
  },
);

final https_url = StringDataSource.withBuilder(
  dataKey: DataKeys.https_url,
  locale: Locales.en_us,
  builder: (_, __) {
    return uri.build(UriArgs(protocol: 'https'));
  },
);

final ipv4 = StringDataSource.withBuilder(
  dataKey: DataKeys.ipv4,
  locale: Locales.en_us,
  builder: (_, __) => List.generate(4, (_) => randomInt(255)).join('.'),
);

final ipv6 = StringDataSource.withBuilder(
  dataKey: DataKeys.ipv6,
  locale: Locales.en_us,
  builder: (_, __) =>
      List.generate(8, (_) => randomInt(65535).toRadixString(16)).join(':'),
);

final mac_address = StringDataSource.withBuilder(
  dataKey: DataKeys.mac_address,
  locale: Locales.en_us,
  builder: (_, __) =>
      List.generate(6, (_) => randomInt(0xff).toRadixString(16).padLeft(2, '0'))
          .join(':'),
);

final password = StringDataSource<PasswordArgs>.withBuilder(
  dataKey: DataKeys.password,
  locale: Locales.en_us,
  builder: (PasswordArgs args, __) {
    if (args.onlyNumeric) {
      return List.generate(args.length, (_) => randomOneDigitInt).join();
    } else {
      return randomString(args.length);
    }
  },
);

final emoji = StringDataSource(
  dataKey: DataKeys.emoji,
  locale: Locales.en_us,
  values: [
    '😀',
    '😃',
    '😄',
    '😁',
    '😆',
    '😅',
    '😂',
    '🤣',
    '🥲',
    '🥹',
    '😊',
    '😇',
    '🙂',
    '🙃',
    '😉',
    '😌',
    '😍',
    '🥰',
    '😘',
    '😗',
    '😙',
    '😚',
    '😋',
    '😛',
    '😝',
    '😜',
    '🤪',
    '🤨',
    '🧐',
    '🤓',
    '😎',
    '🥸',
    '🤩',
    '🥳',
    '😏',
    '😒',
    '😞',
    '😔',
    '😟',
    '😕',
    '🙁',
    '😣',
    '😖',
    '😫',
    '😩',
    '🥺',
    '😢',
    '😭',
    '😮‍💨',
    '😤',
    '😠',
    '😡',
    '🤬',
    '🤯',
    '😳',
    '🥵',
    '🥶',
    '😱',
    '😨',
    '😰',
    '😥',
    '😓',
    '🫣',
    '🤗',
    '🫡',
    '🤔',
    '🫢',
    '🤭',
    '🤫',
    '🤥',
    '😶',
    '😶‍🌫️',
    '😐',
    '😑',
    '😬',
    '🫠',
    '🙄',
    '😯',
    '😦',
    '😧',
    '😮',
    '😲',
    '🥱',
    '😴',
    '🤤',
    '😪',
    '😵',
    '😵‍💫',
    '🫥',
    '🤐',
    '🥴',
    '🤢',
    '🤮',
    '🤧',
    '😷',
    '🤒',
    '🤕',
    '🤑',
    '🤠',
    '😈',
    '👿',
    '👹',
    '👺',
    '🤡',
    '💩',
    '👻',
    '💀',
    '☠️',
    '👽',
    '👾',
    '🤖',
    '🎃',
    '😺',
    '😸',
    '😹',
    '😻',
    '😼',
    '😽',
    '🙀',
    '😿',
    '😾',
  ],
);

// final safe_email = ;
// final domain_name = ;
// final http_url = ;
// final https_url = ;
// final ipv4_address = ;
// final ipv6_address = ;
// final mac_address = ;
// final password = ;
// final user_agent = ;
// final avatar_uri = ;
// final emoji = ;
