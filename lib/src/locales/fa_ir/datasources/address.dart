import 'package:fake_it/src/base/base.dart';

const city_names = DataSource(
  dataKey: DataKeys.city_names,
  locale: Locales.fa_ir,
  formats: [],
  values: [
    'کشکسرای',
    'سهند',
    'سیس',
    'دوزدوزان',
    'تیمورلو',
    'صوفیان',
    'سردرود',
    'هادیشهر',
    'هشترود',
    'زرنق',
    'ترکمانچای',
    'ورزقان',
    'تسوج',
    'زنوز',
    'ایلخچی',
    'شرفخانه',
    'مهربان',
    'مبارک شهر',
    'تیکمه داش',
    'باسمنج',
    'سیه رود',
    'میانه',
    'خمارلو',
    'خواجه',
    'بناب مرند',
    'قره آغاج',
    'وایقان',
    'مراغه',
    'ممقان',
    'خامنه',
    'خسروشاه',
    'لیلان',
    'نظرکهریزی',
    'اهر',
    'بخشایش',
    'آقکند',
    'جوان قلعه',
    'کلیبر',
    'مرند',
    'اسکو',
    'شندآباد',
    'شربیان',
    'گوگان',
    'بستان آباد',
    'تبریز',
    'جلفا',
    'اچاچی',
    'هریس',
    'یامچی',
    'خاروانا',
    'کوزه کنان',
    'خداجو(خراجو)',
    'آذرشهر',
    'شبستر',
    'سراب',
    'ملکان',
    'بناب',
    'هوراند',
    'کلوانق',
    'ترک',
    'عجب شیر',
    'آبش احمد',
    'تازه شهر',
    'نالوس',
    'ایواوغلی',
    'شاهین دژ',
    'گردکشانه',
    'باروق',
    'سیلوانه',
    'بازرگان',
    'نازک علیا',
    'ربط',
    'تکاب',
    'دیزج دیز',
    'سیمینه',
    'نوشین',
    'میاندوآب',
    'مرگنلر',
    'سلماس',
    'آواجیق',
    'قطور',
    'محمودآباد',
    'خوی',
    'نقده',
    'سرو',
    'خلیفان',
    'پلدشت',
    'میرآباد',
    'اشنویه',
    'زرآباد',
    'بوکان',
    'پیرانشهر',
    'چهاربرج',
    'قوشچی',
    'شوط',
    'ماکو',
    'سیه چشمه',
    'سردشت',
    'کشاورز',
    'فیرورق',
    'محمدیار',
    'ارومیه',
    'مهاباد',
    'قره ضیاءالدین',
    'پارس آباد',
    'فخراباد',
    'کلور',
    'نیر',
    '',
    'اسلام اباد',
    'تازه کندانگوت',
    'مشگین شهر',
    'جعفرآباد',
    'نمین',
    'اصلاندوز',
    'مرادلو',
    'خلخال',
    'کوراییم',
    'هیر',
    'گیوی',
    'گرمی',
    'لاهرود',
    'هشتجین',
    'عنبران',
    'تازه کند',
    'قصابه',
    'رضی',
    'سرعین',
    'بیله سوار',
    'آبی بیگلو',
    'گزبرخوار',
    'زیار',
    'زرین شهر',
    'گلشن',
    'پیربکران',
    'خالدآباد',
    'سجزی',
    'گوگد',
    'تیران',
    'ونک',
    'دهق',
    'زواره',
    'کاشان',
    'ابوزیدآباد',
    'اصغرآباد',
    'بافران',
    'شهرضا',
    'خور',
    'مجلسی',
    'هرند',
    'فولادشهر',
    'کمشچه',
    'کلیشادوسودرجان',
    'لای بید',
    'قهجاورستان',
    'چرمهین',
    'رزوه',
    'فریدونشهر',
    'طرق رود',
    'نصرآباد',
    'برزک',
    'سفیدشهر',
    'سمیرم',
    'گلدشت',
    'اردستان',
    'جوشقان قالی',
    'بویین ومیاندشت',
    'کرکوند',
    'درچه',
    'انارک',
    'دولت آباد',
    'ایمانشهر',
    'گرگاب',
    'حسن اباد',
    'سده لنجان',
    'حبیب آباد',
    'بهاران شهر',
    'میمه',
    'تودشک',
    'گلشهر',
    'رضوانشهر',
    'داران',
    'علویجه',
    'نیک آباد',
    'مشکات',
    'آران وبیدگل',
    'خوانسار',
    'نجف آباد',
    'منظریه',
    'فرخی',
    'دیزیچه',
    'اژیه',
    'زاینده رود',
    'خورزوق',
    'قهدریجان',
    'شاهین شهر',
    'بهارستان',
    'چمگردان',
    'دهاقان',
    'برف انبار',
    'بادرود',
    'کوهپایه',
    'گلپایگان',
    'عسگران',
    'حنا',
    'کهریزسنگ',
    'مهاباد',
    'کامو و چوگان',
    'افوس',
    'زیباشهر',
    'کوشک',
    'نایین',
    'سین',
    'زازران',
    'مبارکه',
    'ورزنه',
    'ورنامخواست',
    'شاپورآباد',
    'فلاورجان',
    'وزوان',
    'اصفهان',
    'باغ بهادران',
    'چادگان',
    'دامنه',
    'نطنز',
    'محمدآباد',
    'نیاسر',
    'نوش آباد',
    'کمه',
    'جوزدان',
    'صر',
    'جندق',
    'طالخونچه',
    'خمینی شهر',
    'باغشاد',
    'دستگرد',
    'ابریشم',
    'چهارباغ',
    'آسارا',
    'کرج',
    'طالقان',
    'شهرجدیدهشتگرد',
    'محمدشهر',
    'مشکین دشت',
    'نظرآباد',
    'هشتگرد',
    'ماهدشت',
    'اشتهارد',
    'کوهسار',
    'گرمدره',
    'تنکمان',
    'گلسار',
    'کمال شهر',
    'فردیس',
    'آبدانان',
    'شباب',
    'موسیان',
    'بدره',
    'ایلام',
    'ایوان',
    'مهران',
    'آسمان آباد',
    'پهله',
    'مهر',
    'سراب باغ',
    'بلاوه',
    'میمه',
    'دره شهر',
    'ارکواز',
    'مورموری',
    'توحید',
    'دهلران',
    'لومار',
    'چوار',
    'زرنه',
    'صالح آباد',
    'سرابله',
    'ماژین',
    'دلگشا',
    'ریز',
    'برازجان',
    'بندرریگ',
    'اهرم',
    'دوراهک',
    'خورموج',
    'نخل تقی',
    'کلمه',
    'بندردیلم',
    'وحدتیه',
    'بنک',
    'چغادک',
    'بندردیر',
    'کاکی',
    'جم',
    'دالکی',
    'بندرگناوه',
    'آباد',
    'آبدان',
    'خارک',
    'شنبه',
    'بوشکان',
    'انارستان',
    'شبانکاره',
    'سیراف',
    'دلوار',
    'بردستان',
    'بادوله',
    'عسلویه',
    'تنگ ارم',
    'امام حسن',
    'سعد آباد',
    'بندرکنگان',
    'بوشهر',
    'بردخون',
    'آب پخش',
    'شاهدشهر',
    'پیشوا',
    'جوادآباد',
    'ارجمند',
    'ری',
    'نصیرشهر',
    'رودهن',
    'اندیشه',
    'نسیم شهر',
    'صباشهر',
    'ملارد',
    'شمشک',
    'پاکدشت',
    'باقرشهر',
    'احمد آباد مستوفی',
    'کیلان',
    'قرچک',
    'فردوسیه',
    '',
    'ورامین',
    'فیروزکوه',
    'فشم',
    'پرند',
    'آبعلی',
    'چهاردانگه',
    'تهران',
    'بومهن',
    'وحیدیه',
    'صفادشت',
    'لواسان',
    'فرون اباد',
    'کهریزک',
    'رباطکریم',
    'آبسرد',
    'باغستان',
    'صالحیه',
    'شهریار',
    'قدس',
    'تجریش',
    'شریف آباد',
    'حسن آباد',
    'اسلامشهر',
    'دماوند',
    'پردیس',
    'وردنجان',
    'گوجان',
    'گهرو',
    'سورشجان',
    'سرخون',
    'شهرکرد',
    'منج',
    'بروجن',
    'پردنجان',
    'سامان',
    'فرخ شهر',
    'صمصامی',
    'طاقانک',
    'کاج',
    'نقنه',
    'لردگان',
    'باباحیدر',
    'دستنا',
    'سودجان',
    'بازفت',
    'هفشجان',
    'سردشت',
    'فرادبنه',
    'چلیچه',
    'بن',
    'ان',
    'شلمزار',
    'نافچ',
    'دشتک',
    'بلداجی',
    'آلونی',
    'گندمان',
    'جونقان',
    'ناغان',
    'هارونی',
    'چلگرد',
    'کیان',
    'اردل',
    'سفیددشت',
    'مال خلیفه',
    'اسلامیه',
    'شوسف',
    'قاین',
    'عشق آباد',
    'طبس مسینا',
    'ارسک',
    'آیسک',
    'نیمبلوک',
    'دیهوک',
    'سربیشه',
    'محمدشهر',
    'بیرجند',
    'فردوس',
    'نهبندان',
    'اسفدن',
    'گزیک',
    'حاجی آباد',
    'سه قلعه',
    'آرین شهر',
    'مود',
    'خوسف',
    'قهستان',
    'بشرویه',
    'سرایان',
    'خضری دشت بیاض',
    'طبس',
    'اسدیه',
    'زهان',
    'بار',
    'نیل شهر',
    'جنگل',
    'درود',
    'رباط سنگ',
    'سلطان آباد',
    'فریمان',
    'گناباد',
    'کاریز',
    'همت آباد',
    'سلامی',
    'باجگیران',
    'بجستان',
    'چناران',
    'درگز',
    'کلات',
    'چکنه',
    'نصرآباد',
    'بردسکن',
    'مشهد',
    'کدکن',
    'نقاب',
    'قلندرآباد',
    'کاشمر',
    'شاندیز',
    'نشتیفان',
    'ششتمد',
    'شادمهر',
    'عشق آباد',
    'چاپشلو',
    'رشتخوار',
    'قدمگاه',
    'صالح آباد',
    'داورزن',
    'فرهادگرد',
    'کاخک',
    'مشهدریزه',
    'جغتای',
    'مزدآوند',
    'قوچان',
    'یونسی',
    'سنگان',
    'نوخندان',
    'کندر',
    'نیشابور',
    'احمدابادصولت',
    'شهراباد',
    'رضویه',
    'تربت حیدریه',
    'باخرز',
    'سفیدسنگ',
    'بیدخت',
    'تایباد',
    'فیروزه',
    'قاسم آباد',
    'سبزوار',
    'فیض آباد',
    'گلمکان',
    'لطف آباد',
    'شهرزو',
    'خرو',
    'تربت جام',
    'انابد',
    'ملک آباد',
    'بایک',
    'دولت آباد',
    'سرخس',
    'ریوش',
    'طرقبه',
    'خواف',
    'روداب',
    'خلیل آباد',
    'چناران شهر',
    'راز',
    'پیش قلعه',
    'قوشخانه',
    'شوقان',
    'اسفراین',
    'گرمه',
    'قاضی',
    'شیروان',
    'حصارگرمخان',
    'آشخانه',
    'تیتکانلو',
    'جاجرم',
    'بجنورد',
    'درق',
    'آوا',
    'زیارت',
    'سنخواست',
    'صفی آباد',
    'ایور',
    'فاروج',
    'لوجلی',
    'هفتگل',
    'بیدروبه',
    'شاوور',
    'حمزه',
    'گتوند',
    'شرافت',
    'منصوریه',
    'زهره',
    'رامهرمز',
    'بندرامام خمینی',
    'کوت عبداله',
    'میداود',
    'چغامیش',
    'ملاثانی',
    'چم گلک',
    'حر',
    'شمس آباد',
    'آبژدان',
    'چویبده',
    'مسجدسلیمان',
    'مقاومت',
    'ترکالکی',
    'دارخوین',
    'سردشت',
    'لالی',
    'کوت سیدنعیم',
    'حمیدیه',
    'دهدز',
    'قلعه تل',
    'میانرود',
    'رفیع',
    'اندیمشک',
    'الوان',
    'سالند',
    'صالح شهر',
    'اروندکنار',
    'سرداران',
    'تشان',
    'رامشیر',
    'شادگان',
    'بندرماهشهر',
    'جایزان',
    'بستان',
    'ویس',
    'اهواز',
    'فتح المبین',
    'شهر امام',
    'قلعه خواجه',
    'حسینیه',
    'گلگیر',
    'مینوشهر',
    'سماله',
    'شوشتر',
    'بهبهان',
    'هندیجان',
    'ابوحمیظه',
    'آغاجاری',
    'ایذه',
    'صیدون',
    'سیاه منصور',
    'هویزه',
    'آزادی',
    'شوش',
    'دزفول',
    'جنت مکان',
    'آبادان',
    'گوریه',
    'خرمشهر',
    'مشراگه',
    'خنافره',
    'چمران',
    'امیدیه',
    'سوسنگرد',
    'شیبان',
    'الهایی',
    'باغ ملک',
    'صفی آباد',
    'سجاس',
    'زرین رود',
    'آب بر',
    'ارمغانخانه',
    'کرسف',
    'هیدج',
    'سلطانیه',
    'خرمدره',
    'نیک پی',
    'قیدار',
    'ابهر',
    'دندی',
    'حلب',
    'نوربهار',
    'گرماب',
    'چورزق',
    'زنجان',
    'سهرورد',
    'صایین قلعه',
    'ماه نشان',
    'زرین آباد',
    'ایوانکی',
    'مجن',
    'دامغان',
    'سرخه',
    'مهدی شهر',
    'شاهرود',
    'سمنان',
    'کهن آباد',
    'گرمسار',
    'کلاته خیج',
    'دیباج',
    'درجزین',
    'رودیان',
    'بسطام',
    'امیریه',
    'میامی',
    'شهمیرزاد',
    'بیارجمند',
    'کلاته',
    'آرادان',
    'محمدی',
    'شهرک علی اکبر',
    'بنجار',
    'گلمورتی',
    'نگور',
    'راسک',
    'بنت',
    'قصرقند',
    'جالق',
    'هیدوچ',
    'نوک آباد',
    'زهک',
    'بمپور',
    'پیشین',
    'گشت',
    'محمدآباد',
    'زاهدان',
    'زابلی',
    'چاه بهار',
    'زرآباد',
    'بزمان',
    'اسپکه',
    'فنوج',
    'سراوان',
    'ادیمی',
    'زابل',
    'دوست محمد',
    'ایرانشهر',
    'سرباز',
    'سیرکان',
    'میرجاوه',
    'نصرت آباد',
    'سوران',
    'خاش',
    'کنارک',
    'محمدان',
    'نیک شهر',
    'کازرون',
    'کارزین (فتح آباد)',
    'فدامی',
    'خومه زار',
    'سلطان شهر',
    'فیروزآباد',
    'دبیران',
    'باب انار',
    'رامجرد',
    'سروستان',
    'قره بلاغ',
    'ارسنجان',
    'دژکرد',
    'بیرم',
    'دهرم',
    'شیراز',
    'اخواست',
    'علامرودشت',
    'اوز',
    'وراوی',
    'بیضا',
    'نی ریز',
    'کنارتخته',
    'امام شهر',
    'جهرم',
    'بابامنیر',
    'گراش',
    'فسا',
    'شهرپیر',
    'حسن اباد',
    'کامفیروز',
    'خنج',
    'خانه زنیان',
    'استهبان',
    'بوانات',
    'لطیفی',
    'فراشبند',
    'زرقان',
    'صغاد',
    'اشکنان',
    'قایمیه',
    'گله دار',
    'دوبرجی',
    'آباده طشک',
    'خرامه',
    'میمند',
    'افزر',
    'دوزه',
    'سیدان',
    'کوپن',
    'زاهدشهر',
    'قادراباد',
    'سده',
    'بنارویه',
    'سعادت شهر',
    'شهرصدرا',
    'سورمق',
    'حسامی',
    'جویم',
    'خوزی',
    'اردکان',
    'قطرویه',
    'نودان',
    'مبارک آباددیز',
    'داراب',
    'نورآباد',
    'کوار',
    'نوبندگان',
    'حاجی آباد',
    'خاوران',
    'مرودشت',
    'کوهنجان',
    'ششده',
    'مزایجان',
    'ایج',
    'خور',
    'نوجین',
    'لپویی',
    'بهمن',
    'اهل',
    'خشت',
    'مهر',
    'جنت شهر',
    'مشکان',
    'بالاده',
    'قیر',
    'قطب آباد',
    'خانیمن',
    'مصیری',
    'میانشهر',
    'صفاشهر',
    'اقلید',
    'عمادده',
    'مادرسلیمان',
    'داریان',
    'رونیز',
    'کره ای',
    'لار',
    'اسیر',
    'هماشهر',
    'آباده',
    'لامرد',
    'سگزآباد',
    'بیدستان',
    'کوهین',
    'رازمیان',
    'خرمدشت',
    'آبگرم',
    'شال',
    'شریفیه',
    'اقبالیه',
    'نرجه',
    'ارداق',
    'الوند',
    'خاکعلی',
    'سیردان',
    'ضیاڈآباد',
    'بویین زهرا',
    'محمدیه',
    'محمودآبادنمونه',
    'معلم کلایه',
    'اسفرورین',
    'آوج',
    'دانسفهان',
    'آبیک',
    'قزوین',
    'تاکستان',
    'کهک',
    'قم',
    'سلفچگان',
    'جعفریه',
    'قنوات',
    'دستجرد',
    'قروه',
    'توپ آغاج',
    'سروآباد',
    'بویین سفلی',
    'زرینه',
    'دلبران',
    'سنندج',
    'یاسوکند',
    'موچش',
    'بانه',
    'مریوان',
    'سریش آباد',
    'صاحب',
    'دهگلان',
    'بابارشانی',
    'دیواندره',
    'برده رشه',
    'شویشه',
    'بیجار',
    'اورامان تخت',
    'کانی سور',
    'کانی دینار',
    'دزج',
    'سقز',
    'بلبان آباد',
    'پیرتاج',
    'کامیاران',
    'آرمرده',
    'چناره',
    'کهنوج',
    'بلوک',
    'پاریز',
    'گنبکی',
    'زنگی آباد',
    'بم',
    'خانوک',
    'کیانشهر',
    'جوپار',
    'عنبرآباد',
    'جوزم',
    'نظام شهر',
    'لاله زار',
    'کشکوییه',
    'زیدآباد',
    'هنزا',
    'چترود',
    'جبالبارز',
    'سیرجان',
    'رودبار',
    'کرمان',
    'بافت',
    'صفاییه',
    'منوجان',
    'اندوهجرد',
    'هجدک',
    'خورسند',
    'امین شهر',
    'بردسیر',
    'رفسنجان',
    'هماشهر',
    'محمدآباد',
    'اختیارآباد',
    'بروات',
    'ریحان',
    'کوهبنان',
    'ماهان',
    'دوساری',
    'دهج',
    'فاریاب',
    'گلزار',
    'بهرمان',
    'بلورد',
    'فهرج',
    'کاظم آباد',
    'جیرفت',
    'نجف شهر',
    'قلعه گنج',
    'باغین',
    'زرند',
    'نودژ',
    'گلباف',
    'راور',
    'خاتون اباد',
    'نرماشیر',
    'دشتکار',
    'مس سرچشمه',
    'خواجو شهر',
    'رابر',
    'راین',
    'درب بهشت',
    'ان شهر',
    'زهکلوت',
    'محی آباد',
    'مردهک',
    'شهداد',
    'ارزوییه',
    'نگار',
    'شهربابک',
    'انار',
    'سنقر',
    'شاهو',
    'بانوره',
    'تازه آباد',
    'هلشی',
    'جوانرود',
    'قصرشیرین',
    'نوسود',
    'کرند',
    'کوزران',
    'بیستون',
    'حمیل',
    'غرب',
    'سطر',
    'روانسر',
    'پاوه',
    'ازگله',
    'کرمانشاه',
    'میان راهان',
    'کنگاور',
    'سرپل ذهاب',
    'ریجاب',
    'باینگان',
    'هرسین',
    'اسلام آبادغرب',
    'سرمست',
    'سومار',
    'نودشه',
    'گهواره',
    'رباط',
    'صحنه',
    'گودین',
    'گراب سفلی',
    'لنده',
    'سی سخت',
    'دهدشت',
    'یاسوج',
    'سرفاریاب',
    'دوگنبدان',
    'چیتاب',
    'لیکک',
    'دیشموک',
    'مادوان',
    'باشت',
    'پاتاوه',
    'قلعه رییسی',
    'مارگون',
    'چرام',
    'سوق',
    'سیمین شهر',
    'مزرعه',
    'رامیان',
    'فراغی',
    'گنبدکاووس',
    'کردکوی',
    'مراوه',
    'بندرترکمن',
    'نگین شهر',
    'آق قلا',
    'سرخنکلاته',
    'گالیکش',
    'سنگدوین',
    'دلند',
    'بندرگز',
    'نوده خاندوز',
    'مینودشت',
    'گرگان',
    'گمیش تپه',
    'علی اباد',
    'خان ببین',
    'کلاله',
    'اینچه برون',
    'فاضل آباد',
    'تاتارعلیا',
    'نوکنده',
    'آزادشهر',
    'انبارآلوم',
    'جلین',
    'منجیل',
    'شلمان',
    'خشکبیجار',
    'ماکلوان',
    'سنگر',
    'مرجقل',
    'لیسار',
    'رضوانشهر',
    'رحیم آباد',
    'لوندویل',
    'احمدسرگوراب',
    'لوشان',
    'اطاقور',
    'لشت نشاء',
    'فومن',
    'چوبر',
    'بازار جمعه',
    'کلاچای',
    'بندرانزلی',
    'املش',
    'رستم آباد',
    'لاهیجان',
    'توتکابن',
    'لنگرود',
    'کوچصفهان',
    'صومعه سرا',
    'اسالم',
    'دیلمان',
    'رودسر',
    'کیاشهر',
    'شفت',
    'رودبار',
    'کومله',
    'رشت',
    'ماسوله',
    'خمام',
    'ماسال',
    'واجارگاه',
    'هشتپر (تالش)',
    'پره سر',
    'بره سر',
    'آستارا',
    'رودبنه',
    'جیرنده',
    'چاف و چمخاله',
    'لولمان',
    'گوراب زرمیخ',
    'حویق',
    'سیاهکل',
    'چابکسر',
    'آستانه اشرفیه',
    'رانکوه',
    'چالانچولان',
    'بیران شهر',
    'ویسیان',
    'شول آباد',
    'پلدختر',
    'کوهدشت',
    'هفت چشمه',
    'بروجرد',
    'الشتر',
    'مومن آباد',
    'دورود',
    'زاغه',
    'چقابل',
    'الیگودرز',
    'معمولان',
    'کوهنانی',
    'نورآباد',
    'سپیددشت',
    'سراب دوره',
    'ازنا',
    'گراب',
    'خرم آباد',
    'اشترینان',
    'فیروزآباد',
    'درب گنبد',
    'گلوگاه',
    'گلوگاه',
    'پل سفید',
    'دابودشت',
    'چالوس',
    'کیاسر',
    'بهنمیر',
    'تنکابن',
    'کلاردشت',
    'اشهر',
    'گتاب',
    'سلمان شهر',
    'ارطه',
    'امیرکلا',
    'کوهی خیل',
    'پایین هولار',
    'گزنک',
    'محمودآباد',
    'رامسر',
    'نوشهر',
    'خلیل شهر',
    'کیاکلا',
    'نور',
    'مرزیکلا',
    'فریدونکنار',
    'زیرآب',
    'امامزاده عبدالله',
    'هچیرود',
    'فریم',
    'هادی شهر',
    'نشتارود',
    'پول',
    'بهشهر',
    'کلارآباد',
    'بلده',
    'بابل',
    'جویبار',
    'آلاشت',
    'آمل',
    'نکا',
    'کتالم وسادات شهر',
    'بابلسر',
    'شیرود',
    'شیرگاه',
    'رویان',
    'زرگرمحله',
    'عباس اباد',
    'قایم شهر',
    'خوش رودپی',
    'مرزن آباد',
    'ساری',
    'رینه',
    'سرخرود',
    'خرم آباد',
    'کجور',
    'رستمکلا',
    'سورک',
    'چمستان',
    'آستانه',
    'خنجین',
    'نراق',
    'کمیجان',
    'آشتیان',
    'رازقان',
    'مهاجران',
    'غرق آباد',
    'خنداب',
    'قورچی باشی',
    'خشکرود',
    'ساروق',
    'محلات',
    'شازند',
    'ساوه',
    'میلاجرد',
    'تفرش',
    'زاویه',
    'اراک',
    'توره',
    'نوبران',
    'فرمهین',
    'دلیجان',
    'پرندک',
    'کارچان',
    'نیمور',
    'هندودر',
    'آوه',
    'جاورسیان',
    'خمین',
    'مامونیه',
    'داودآباد',
    'شهباز',
    'بیکاء',
    'تیرور',
    'گروک',
    'قشم',
    'کوشکنار',
    'کیش',
    'سرگز',
    'بندرعباس',
    'زیارتعلی',
    'سندرک',
    'کوهستک',
    'لمزان',
    'رویدر',
    'قلعه قاضی',
    'فارغان',
    'ابوموسی',
    'هشتبندی',
    'سردشت',
    'درگهان',
    'پارسیان',
    'کنگ',
    'جناح',
    'تازیان پایین',
    'دهبارز',
    'میناب',
    'سیریک',
    'سوزا',
    'خمیر',
    'چارک',
    'حاجی اباد',
    'فین',
    'بندرجاسک',
    'گوهران',
    'هرمز',
    'دشتی',
    'بندرلنگه',
    'بستک',
    'تخت',
    'زنگنه',
    'دمق',
    'سرکان',
    'آجین',
    'جورقان',
    'برزول',
    'فامنین',
    'سامن',
    'بهار',
    'فرسفج',
    'شیرین سو',
    'مریانج',
    'فیروزان',
    'قروه درجزین',
    'ازندریان',
    'لالجین',
    'گل تپه',
    'گیان',
    'ملایر',
    'صالح آباد',
    'تویسرکان',
    'اسدآباد',
    'همدان',
    'نهاوند',
    'رزن',
    'جوکار',
    'مهاجران',
    'کبودرآهنگ',
    'قهاوند',
    'مروست',
    'مهردشت',
    'حمیدیا',
    'تفت',
    'اشکذر',
    'ندوشن',
    'یزد',
    'عقدا',
    'بهاباد',
    'ابرکوه',
    'زارچ',
    'نیر',
    'اردکان',
    'هرات',
    'بفروییه',
    'شاهدیه',
    'بافق',
    'خضرآباد',
    'میبد',
    'مهریز',
    'احمدآباد',
  ],
);

const street_names = DataSource(
  dataKey: DataKeys.street_names,
  locale: Locales.fa_ir,
  formats: [
    Format(
      '{{${DataKeys.street_prefixes}}} {{${DataKeys.last_names}}}',
      chance: 20,
    ),
    Format(
      '{{${DataKeys.last_names}}} {{${DataKeys.street_suffixes}}}',
      chance: 4,
    ),
  ],
  values: [],
);

const street_suffixes = DataSource(
  dataKey: DataKeys.street_suffixes,
  locale: Locales.fa_ir,
  values: [
    'شمالی',
    'غربی',
    'شرقی',
    'جنوبی',
    'اول',
    'دوم',
    'سوم',
    'چهارم',
    'پنجم',
    'ششم',
    'هفتم',
    'هشتم',
    'نهم',
    'دهم',
  ],
);

const street_prefixes = DataSource(
  dataKey: DataKeys.street_prefixes,
  locale: Locales.fa_ir,
  values: ['خیابان', 'کمربندی', 'بزرگراه'],
);

const states = DataSource(
  dataKey: DataKeys.states,
  locale: Locales.fa_ir,
  values: [
    'آذربایجان شرقی',
    'آذربایجان غربی',
    'اردبیل',
    'خراسان',
    'کردستان',
    'گیلان',
    'اصفهان',
    'البرز',
    'ایلام',
    'بوشهر',
    'تهران',
    'چهارمحال و بختیاری',
    'خراسان جنوبی',
    'خراسان رضوی',
    'خراسان شمالی',
    'خوزستان',
    'زنجان',
    'سمنان',
    'سیستان و بلوچستان',
    'فارس',
    'قزوین',
    'قم',
    'کرمان',
    'کرمانشاه',
    'کهگیلویه و بویراحمد',
    'گلستان',
    'لرستان',
    'مازندران',
    'مرکزی',
    'هرمزگان',
    'همدان',
    'یزد',
  ],
);

const postcodes = DataSource(
  dataKey: DataKeys.postcodes,
  locale: Locales.fa_ir,
  formats: [Format('##########')],
  values: [],
);

const building_names = DataSource(
  dataKey: DataKeys.building_names,
  locale: Locales.fa_ir,
  formats: [
    Format('{{${DataKeys.first_names}}}', chance: 20),
    Format('{{${DataKeys.first_names}}} #', chance: 4),
  ],
  values: [],
);

const addresses = DataSource(
  dataKey: DataKeys.addresses,
  locale: Locales.fa_ir,
  formats: [
    Format(
      '{{${DataKeys.city_names}}}, {{${DataKeys.street_names}}}, {{${DataKeys.alleys}}}, {{${DataKeys.building_names}}}, طبقه #, واحد #',
    ),
    Format(
      '{{${DataKeys.city_names}}}, {{${DataKeys.street_names}}}, {{${DataKeys.alleys}}}, پلاک ##',
    ),
  ],
  values: [],
);

const alleys = DataSource(
  dataKey: DataKeys.alleys,
  locale: Locales.fa_ir,
  formats: [
    Format('کوچه {{${DataKeys.first_names}}} #', chance: 4),
    Format('کوچه {{${DataKeys.first_names}}}', chance: 20),
    Format('محله {{${DataKeys.last_names}}}', chance: 3),
    Format('شهرک {{${DataKeys.last_names}}}', chance: 3),
  ],
  values: [],
);
