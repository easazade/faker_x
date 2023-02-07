import 'dart:math';

import 'package:fake_it/src/base/base.dart';

final _random = Random();

final _persianNumbers = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

final _persianLetters = [
  'الف',
  'ب',
  'پ',
  'ت',
  'ث',
  'ج',
  'چ',
  'ح',
  'خ',
  'د',
  'ذ',
  'ر',
  'ز',
  'ژ',
  'س',
  'ش',
  'ص',
  'ض',
  'ط',
  'ظ',
  'ع',
  'غ',
  'ف',
  'ق',
  'ک',
  'گ',
  'ل',
  'م',
  'ن',
  'و',
  'ه',
  'ی',
];

final license_plate = DataSource.withBuilder(
  dataKey: DataKeys.license_plate,
  locale: Locales.fa_ir,
  builder: () {
    var plate = '#####';

    plate = plate.replaceAllMapped('#',
        (match) => _persianNumbers[_random.nextInt(_persianNumbers.length)]);

    plate = plate.substring(0, 2) +
        ' ' +
        _persianLetters[_random.nextInt(_persianLetters.length)] +
        ' ' +
        plate.substring(2);

    while (plate[0] == '۰') {
      plate = plate.replaceFirst(
          '۰', _persianNumbers[_random.nextInt(_persianNumbers.length)]);
    }

    return plate;
  },
);
