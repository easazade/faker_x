import 'package:fake_it/src/base/data_list.dart';
import 'package:fake_it/src/base/format.dart';
import 'package:fake_it/src/base/keys.dart';

const jobPrefixes = DataList(
  values: [
    'سر',
    //TODO: add more
  ],
);

const jobSuffixes = DataList(
  values: [
    'ارشد',
    'داخلی',
    //TODO: add more
  ],
);

const jobTitles = DataList(
  formats: [
    Format(
        '{{${Keys.jobPrefixes}}} {{${Keys.jobTitles}}} {{${Keys.jobSuffixes}}}'),
    Format('{{${Keys.jobPrefixes}}} {{${Keys.jobTitles}}}'),
    Format('{{${Keys.jobTitles}}} {{${Keys.jobSuffixes}}}'),
  ],
  values: [
    'حسابدار',
    'منشی',
    'صندوقدار',
    'کارمند اداری',
    'مدیر مالی',
    'مسئول دفتر',
    'کارشناس فروش',
    'کارشناس بازاریابی',
    'کارشناس بازرگانی داخلی',
    'ویزیتور',
    'فروشنده',
    'استاد دانشگاه',
    'پژوهشگر',
    'معلم',
    'مربی مهد کودک',
    'سرایدار',
    'خیاط',
    'کارگر ساده',
    'نانوا',
    'مکانیک',
    'مهندس راه آهن',
    'مهندس معدن',
    'مهندس پزشکی',
    'مهندس پلیمر',
    'مهندس عمران',
    'برنامه نویس',
    'برنامه نویس فلاتر',
    'برنامه نویس موبایل',
    'برنامه نویس وب',
    'برنامه نویس فرانت اند',
    'برنامه نویس بک اند',
    'کارشناس شبکه',
    'طراح وب سایت',
    'کارشناس سخت افزار',
    'کارشناس امنیت اطلاعات',
    'وکیل',
    'پلیس',
    '-قاضی',
    'دادیار',
    'کارشناس روابط عمومی',
    'کارشناس شبکه های اجتماعی',
    'خبرنگار',
    'کارشناس مرکز تماس',
    'کارشناس دیجیتال مارکتینگ',
    'جراح زیبایی',
    'دندان پزشک',
    'پرستار',
    'ماما',
    'تکنسین اتاق عمل',
    '-پیک موتوری',
    'راننده',
    'خلبان',
    'ناخدای کشتی',
    'طراح لباس',
    'نقاش',
    'بازیگر',
    'عکاس',
    'نویسنده',
    'کشاورز',
    'دام دار',
    'زنبور',
    'کارشناس محیط زیست',
    'مددکار',
    'مشاور',
  ],
);
