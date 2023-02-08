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

final email = DataSource<EmailArgs>.withBuilder(
  dataKey: DataKeys.email,
  locale: Locales.en_us,
  builder: (EmailArgs args) {
    final userName = provide(
      DataKeys.user_name_from,
      Locales.en_us,
      args: UsernameArgs(firstName: args.firstName, lastName: args.lastName),
    );

    return '$userName@gmail.com'.toLowerCase();
  },
);

final user_name = DataSource.withBuilder(
  dataKey: DataKeys.user_name,
  locale: Locales.en_us,
  builder: (_) {
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

final user_name_from = DataSource<UsernameArgs>.withBuilder(
  dataKey: DataKeys.user_name_from,
  locale: Locales.en_us,
  builder: (UsernameArgs args) {
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

// final disposable_email = ;
// final free_email = ;
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
