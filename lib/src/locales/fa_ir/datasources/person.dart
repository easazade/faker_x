import 'package:fake_it/src/base/base.dart';

const full_name = DataSource(
  dataKey: DataKeys.full_name,
  locale: Locales.fa_ir,
  formats: [
    Format('{{${DataKeys.first_name_female}}} {{${DataKeys.last_name}}}'),
    Format('{{${DataKeys.first_name_male}}} {{${DataKeys.last_name}}}'),
  ],
  values: [],
);

const first_name = DataSource(
  dataKey: DataKeys.first_name,
  locale: Locales.fa_ir,
  formats: [
    Format('{{${DataKeys.first_name_female}}}'),
    Format('{{${DataKeys.first_name_male}}}'),
  ],
  values: [],
);

const first_name_female = DataSource(
  dataKey: DataKeys.first_name_female,
  locale: Locales.fa_ir,
  values: [
    'فاطمه',
    'اسما',
    'زهرا',
    'عسل',
    'نازنین زهرا',
    'النا',
    'زینب',
    'سارا',
    'یسنا',
    'آتنا',
    'ریحانه',
    'آیناز',
    'هستی',
    'محیا',
    'ستایش',
    'باران',
    'ثنا',
    'هلیا',
    'مریم',
    'یلدا',
    'فاطمه زهرا',
    'ملیكا',
    'سارینا',
    'نازنین',
    'مهسا',
    'آیلین',
    'نرگس',
    'حنانه',
    'رقیه',
    'كیانا',
    'كوثر',
    'هانیه',
    'مبینا',
    'مهدیس',
    'رها',
    'آوا',
    'اسرا',
    'یگانه',
    'نیایش',
    'حدیث',
    'الینا',
    'سوگند',
    'مائده',
    'پریا',
    'معصومه',
    'مهدیه',
    'آیدا',
    'الناز',
    'محدثه',
    'یاسمین',
    'فاطمه',
    'ستايش',
    'زهرا',
    'مائده',
    'نازنين',
    'مبينا',
    'يسنا',
    'عسل',
    'زينب',
    'آيناز',
    'ريحانه',
    'هليا',
    'فاطمه',
    'سوگند',
    'باران',
    'سارا',
    'رها',
    'محدثه',
    'ثنا',
    'الينا',
    'کوثر',
    'آتنا',
    'مريم',
    'فاطميا',
    'سارينا',
    'ياسمين',
    'اسرا',
    'حسنا',
    'رقيه',
    'اسما',
    'هستي',
    'مهديس',
    'محيا',
    'هانيه',
    'آيلين',
    'حنانه',
    'مهسا',
    'پرنيا',
    'نرگس',
    'آيدا',
    'معصومه',
    'کيانا',
    'حلما',
    'مليکا',
    'آوا',
    'نازنين',
    'النا',
    'الناز',
    'نيايش',
    'بهار',
  ],
);

const first_name_male = DataSource(
  dataKey: DataKeys.first_name_male,
  locale: Locales.fa_ir,
  values: [
    'امیر علی',
    'پرهام',
    'ابوالفضل',
    'كیان',
    'امیرحسین',
    'متین',
    'محمد طاها',
    'عرفان',
    'محمد',
    'دانیال',
    'علی',
    'آرمین',
    'امیرمحمد',
    'آرتین',
    'حسین',
    'سبحان',
    'مهدی',
    'سینا',
    'محمد مهدی',
    'آریا',
    'محمدرضا',
    'محمدپارسا',
    'طاها',
    'سجاد',
    'امیررضا',
    'آرش',
    'امیرعباس',
    'نیما',
    'علیرضا',
    'عرشیا',
    'محمدامین',
    'مبین',
    'محمدحسین',
    'یوسف',
    'رضا',
    'احسان',
    'علی اصغر',
    'آرین',
    'امیرمهدی',
    'محمدیاسین',
    'ماهان',
    'عباس',
    'پارسا',
    'حسام',
    'یاسین',
    'علی رضا',
    'ایلیا',
    'علی اكبر',
    'محمدجواد',
    'بنیامین',
    'اميرعلي',
    'ايليا',
    'محمد',
    'محمدپارسا',
    'محمد',
    'پرهام',
    'ابوالفضل',
    'سبحان',
    'اميرحسين',
    'آرتين',
    'علي',
    'آرمين',
    'حسين',
    'عرفان',
    'اميرمحمد',
    'آريا',
    'اميرعباس',
    'محمدياسين',
    'محمدمهدي',
    'متين',
    'محمدرضا',
    'دانيال',
    'مهدي',
    'ساميار',
    'محمدحسين',
    'احسان',
    'اميررضا',
    'آرين',
    'عليرضا',
    'سينا',
    'محمدامين',
    'آراد',
    'علي',
    'سجاد',
    'طاها',
    'حسام',
    'رضا',
    'يوسف',
    'ماهان',
    'آرش',
    'مبين',
    'ياسين',
    'علي',
    'اميرمهدي',
    'عباس',
    'پارسا',
    'محمدعلي',
    'کيان',
    'محمدجواد',
    'بنيامين',
  ],
);

const last_name = DataSource(
  dataKey: DataKeys.last_name,
  locale: Locales.fa_ir,
  formats: [],
  values: [
    'محمدی',
    'محمد پور',
    'اکبر پور',
    'رضا زاده',
    'مجتهدی',
    'دایی',
    'حمیدی',
    'کابلی',
    'عبدالعلی',
    'احمدی',
    'اشرفی',
    'علیجانی',
    'ابوطالبی',
    'علی شاهی',
    'الوندی',
    'بهمنی',
    'بهرامی',
    'هنری',
    'ایروانی',
    'حریریان',
    'جعفر پور',
    'جلالی',
    'جلیلی',
    'روحانی',
    'خسروجردی',
    'منصوری',
    'مهدیان',
    'نوروزی',
    'نوری',
    'رسته',
    'سماوات',
    'سمسار',
    'شادروان',
    'شاکری',
    'سلطانی',
    'شبیری',
    'تحسینی',
    'تنزیلی',
    'طلوعی',
    'ولاشجردی',
    'وثاق',
    'ظفری',
    'زمانی',
    'زارع',
    'زارعی',
    'ربانی',
    'شمشیری',
    'صارمی',
    'صیادی',
    'سرخوشیان',
    'رستمی',
    'رسولی',
    'رفیعی',
    'کریمی',
    'کرمانی',
    'سعیدی',
    'عباسی',
    'پویان',
    'ترکاشوند',
    'زنجانی',
    'تهرانی',
    'جنتی',
    'صنایعی',
    'جهانی',
    'اشتری',
    'چنگیزی',
    'دادفر',
    'سغیری',
    'پارسا',
    'ضابطی',
    'میردامادی',
    'عقیلی',
    'نامور',
    'حسنی',
    'لاهوتی',
    'محجوب',
    'هاشمی',
    'معروف',
    'معین',
    'هوشیار',
    'هومن',
    'هدایت',
    'قاضی',
    'ملکیان',
    'ضرغامی',
    'یزدی',
    'نوبختی',
    'مجتبوی',
    'نیلوفری',
    'لاچینی',
    'علی پور',
    'عبدالمالکی',
    'فرجی',
    'موسوی',
    'همدانی',
    'موحد',
    'کمالی',
    'گلپایگانی',
    'نعمتی',
    'عزیزی',
    'رودگر',
  ],
);
