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
  builder: (EmailArgs args) {},
);

final user_name = DataSource<UsernameArgs>.withBuilder(
  dataKey: DataKeys.user_name,
  locale: Locales.en_us,
  builder: (UsernameArgs args) {
    if (args.firstName != null && args.lastName != null) {
      return '${args.firstName}_${args.lastName}$randomOneDigitInt';
    } else if (args.firstName != null) {
      return '${args.firstName}$randomOneDigitInt';
    } else if (args.lastName != null) {
      return '${args.lastName}$randomOneDigitInt';
    }
    return 'simple_username';
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