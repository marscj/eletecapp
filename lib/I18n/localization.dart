part of 'i18n.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

class FAQ {
  String title;
  String subTtitle;

  FAQ(this.title, this.subTtitle);
}

class Localization implements WidgetsLocalizations {
  const Localization();

  static Localization current;

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static Localization of(BuildContext context) =>
      Localizations.of<Localization>(context, Localization);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get send => 'SEND';

  String get reSend => 'RESEND';

  String get phoneNumber => 'Phone Number';

  String get otp => 'OTP';

  String get verify => 'VERIFY';

  String get requiredString => 'This field is required!';

  String get verification => 'Phone Number Verification';

  String get receiveHelp => 'Didn\'t receive the code?';

  String get services => 'SERVICES';

  String get orders => 'ORDERS';

  String get settings => 'SETTINGS';

  String get ourServices => 'Our Services';

  String get contactUs => 'Contract Us';

  String get call => 'CALL';

  String get support =>
      'If you have any questions, please call us, or send an email to support@eletec.ae';

  String get address => 'Address';

  String get contract => 'Contract';

  String get faqs => 'Faqs';

  String get language => 'Language';

  String get english => 'English';

  String get arabic => 'Arabic';

  String get logout => 'LOGOUT';

  String get firstName => 'First Name';

  String get lastName => 'Last Name';

  String get avatar => 'Avatar';

  String get submit => 'SUBMIT';

  String get camera => 'Camera';

  String get gallery => 'Gallery';

  String get cancel => 'Cancel';

  String get userProfile => 'User Profile';

  String get joinUs => 'Join Us ?';

  String get email => 'Email';

  String get code => 'Code';

  String verfiy(bool b) => b ? 'Verified' : 'unverified';

  List<String> get contractOption =>
      ['Economy', 'Standard', 'Premium', 'Customized'];

  List<String> get orderStatus => [
        'New',
        'Confirm',
        'Complete',
        'Pending',
        'Cancel',
        'Delete',
      ];

  List<String> get serviceType => [
        'AC',
        'Electrical',
        'Plumbing',
        'Cleaning',
      ];

  List<List<String>> get mainInfo => [
        [
          //AC
          'AC cooling repair',
          'AC noise repair',
          'AC digital controller installation',
          'AC controller repair',
          'AC tripping repair',
          'AC leakage repair',
          'AC service',
          'Other custom job e.g new AC unit installation'
        ],
        [
          //Electrical
          'Light fixture repair',
          'Power outlets & Switches repair',
          'Light fixture installation',
          'Water heater repair',
          'Other custom job e.g LED installation'
        ],
        [
          //Plumbing
          'Water pump or motor repair',
          'Water leakage repair',
          'Small fitting (e.g.faucet) repair',
          'Water tank cleaning',
          'Other custom job e.g outdoor plumbing'
        ],
        [
          //Cleaning
          'General cleaning',
          'Floor cleaning or pilishing'
        ]
      ];

  List<List<List<String>>> get subInfo => [
        [
          //AC
          [
            'Low cooling',
            'Too much cooling',
            'No cooling',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bed Room',
            'Kitchen',
            'Living Room',
            'Bath Room',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Reduce electricity bill',
            'Convenience of the remote',
            'Better control over temperature',
            'Display of the controller',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bed Room',
            'Kitchen',
            'Living Room',
            'Bath Room',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Low cooling and no other reasons',
            'Higher electricity bills',
            'Frequent breakdowns',
            'Reduced life of the compressor',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bed Room',
            'Kitchen',
            'Living Room',
            'Bath Room',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Dirty air',
            'Low cooling',
            'Using after a long time',
            'Just regular service',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'New AC unit installation',
            'AC unit replacement',
            'AC unit relocation',
            'Other(Provide in Instruction Box / attached photo)'
          ],
        ],
        [
          // Electrical
          [
            'Broken',
            'Not working',
            'Better design',
            'Tripping',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Broken',
            'Not working',
            'Better design',
            'Tripping',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bedroom',
            'Kitchen',
            'Living Room',
            'Bathroom',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'No or slow heating',
            'Leaking',
            'Overheating',
            'Rusty or discolored water',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Yellow Light',
            'White Ligth',
            'Spiral bright white',
            'LED',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Repair',
            'New installation',
            'Fitting relocation',
            'Other(Provide in Instruction Box / attached photo)'
          ],
        ],
        [
          // Plumbing
          [
            'Not starting or jammed',
            'Too noisy',
            'Low or no pressure',
            'Leaking',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bedroom',
            'Kitchen',
            'Living Room',
            'Bathroom',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Broken',
            'Clogged',
            'Better quality',
            'Leaking',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Regular cleaning',
            'Post construction cleaning',
            'Not cleaned for too long',
            'Water dirty or smelling',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Repair',
            'New installation',
            'Other(Provide in Instruction Box / attached photo)'
          ],
        ],
        [
          // Cleaning
          [
            'Regular cleaning',
            'Pre Party cleaning',
            'Post Party cleaning',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Ceramic Tiles',
            'Marble',
            'Brick',
            'Other(Provide in Instruction Box / attached photo)'
          ]
        ]
      ];

  List<FAQ> get faq => [
        new FAQ('What services do we offer?', '''
We offer over maintenance services within the following service categories - AC, Plumbing, Electrical, House Cleaning, For more details, kindly visit www.eletec.ae .
'''),
        new FAQ('How do I book a service?', '''
Customers can book a service using the following methods –
1)Book from our iOS and Android mobile apps.
2)Or give us a call +971 50 307 0781.
We recommend downloading and using our Android and iOS mobile apps, for the best user end-to-end experience.
'''),
        new FAQ('Can I schedule a service for a later date/time?', '''
Customers can book a Scheduled Service (> 24 hours) offered during standard office hours (8 am to 6 pm) on all working days from Sat to Thu. Such bookings can be scheduled for up to a month in advance. 
'''),
        new FAQ(
            'Are the services available after office hours or Friday or Public Holiday?',
            '''
Yes. Our Scheduled Services are offered on Friday or Public Holidays. But there will be a AED200 charge.
'''),
        new FAQ('What is a Same Day Service on the mobile app?', '''
We offer Same Day Services, for anyone who is flexible on the timing but wants the Service within the day. The same day service does not come with a fixed arrival time commitment but with earliest availability option, within office hours (8 am to 6 pm) on the same day, possibility. You can select on mobile app, to book a Same Day Service. Also, note the Same Day service can only be booked before 12 noon.
'''),
        new FAQ('Do we offer contracts?', '''
Yes, we have contracts for Annual Maintenance Contracts, which we have 4 options (Economy, Standard, Premium, and Customized Package) as per the client needs. You can find the details in our mobile app, or you can or give us a call +971 50 307 0781.
'''),
        new FAQ('Please explain the 7 Day Service Warranty', '''
For every service we deliver, we offer a 7-day service warranty which means that if what we fixed is reported faulty again within 7 calendar days, we will come back and try to fix it for free. In case the issue is with the parts and materials, any return on that will be dependent on the warranty that comes from the supplier. Generally parts do not come with a warranty when bought standalone. Also, our Service Warranty is for repair and installation jobs only.
'''),
        new FAQ(
            'How can I reach my assigned Technician after he has been assigned to me?',
            '''
Once a Genie has been assigned to a customer, a customer can call the Supervisor of the by calling the number provided in the mobile app. This avoids the hassle of saving numbers for a professional every time you take a home maintenance service. There is no direct calling enabled between the technician and the customer.
'''),
        new FAQ('Can I cancel a booking?', '''
To cancel a booking, a customer needs to either call or cancel the booking from the app, by clicking on the delete button. For details on cancellation policy, please refer our policy.
'''),
        new FAQ('Can I reschedule a booking?', '''
You can reschedule a service, following a discussion with the assigned Supervisor of the technician.
'''),
        new FAQ('How and when do I pay for a service?', '''
You can pay for a service by a credit card/ debit card, account transfer or in cash upon completion of your job or as advance if the job requires an advance payment. Advance payment is generally required for jobs which need procurement of parts and materials.
'''),
        new FAQ('How can I leave feedback or raise a complaint?', '''
As a customer, you can evaluate or leave a feedback from the mobile app: Bookings -> Select booked service -> Below you will find Evaluation, select the necessary option from Not Satisfied to Very Satisfied and you can optional write you comment and click Save.
'''),
      ];
}

class $ar extends Localization {
  const $ar();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  @override
  String get send => 'SEND';

  @override
  String get reSend => 'RESEND';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get otp => 'OTP';

  @override
  String get verify => 'VERIFY';

  @override
  String get requiredString => 'This field is required!';

  @override
  String get verification => 'Phone Number Verification';

  @override
  String get receiveHelp => 'Didn\'t receive the code?';

  @override
  String get services => 'SERVICES';

  @override
  String get orders => 'ORDERS';

  @override
  String get settings => 'SETTINGS';

  @override
  String get ourServices => 'Our Services';

  @override
  String get contactUs => 'Contract Us';

  @override
  String get call => 'CALL';

  @override
  String get support =>
      'If you have any questions, please call us, or send an email to support@eletec.ae';

  @override
  String get address => 'Address';

  @override
  String get contract => 'Contract';

  @override
  String get faqs => 'Faqs';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get logout => 'LOGOUT';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get avatar => 'Avatar';

  @override
  String get submit => 'SUBMIT';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get cancel => 'Cancel';

  @override
  String get userProfile => 'User Profile';

  @override
  String get joinUs => 'Join Us ?';

  @override
  String get email => 'Email';

  @override
  String get code => 'Code';

  @override
  String verfiy(bool b) => b ? 'verified' : 'unverified';

  @override
  List<String> get contractOption =>
      ['Economy', 'Standard', 'Premium', 'Customized'];

  @override
  List<String> get orderStatus => [
        'New',
        'Confirm',
        'Complete',
        'Pending',
        'Cancel',
        'Delete',
      ];

  @override
  List<String> get serviceType => [
        'AC',
        'Electrical',
        'Plumbing',
        'Cleaning',
      ];

  @override
  List<List<String>> get mainInfo => [
        [
          //AC
          'إصلاح أعطال التبريد للمكييف',
          'إصلاح أعطال الضجيج المكييف',
          'تركيب وحدة تحكم رقمية جديدة للمكييف',
          'إصلاح وحدة تحكم للمكييف',
          'إصلاح التوقف المفاجأ للمكيييف',
          'إصلاح أعطال التسريب للمكييف',
          'خدمة  صيانة عامة للمكييف',
          'أعطال أخرى'
        ],
        [
          //Electrical
          'إصلاح إضاءات',
          'إصلاح مفاتيح الكهرباء',
          'تركيب إضاءات',
          'إصلاح سخان الماء',
          'أعمال أخرى حسب الطلب'
        ],
        [
          //Plumbing
          'إصلاح مضخة الماء',
          'إصلاح أعطال تسرب المياه',
          'أعمال إصلاح وتركيب بسيطة',
          'تنظيف خزان الماء',
          'أعمال أخرى حسب الطلب'
        ],
        [
          //Cleaning
          'تنظيف عام',
          'تنظيف وتلميع  الأرضيات'
        ]
      ];

  @override
  List<List<List<String>>> get subInfo => [
        [
          //AC
          ['تبريد منخفض', 'تبريد عالي', 'لا يوجد تبريد', 'أرفق صور إن وجد'],
          ['غرفة نوم', 'مطبخ', '��الة', 'حمام', 'أرفق صور إن وجد'],
          [
            'تقليل استهلاك الكهرباء',
            'سهول التحكم',
            'تحكم افضل لدرجة الحرارة',
            'عرض الشاشة',
            'أرفق صور إن وجد'
          ],
          ['غرفة نوم', 'مطبخ', 'صالة', 'حمام', 'أرفق صور إن وجد'],
          [
            'تبريد اقل أو اسباب اخرى',
            'إستهلاك عالي للكهرباء',
            'اعطال دائمة',
            'انتهاء عمر الإفتراضي للكمبرسيسور',
            'أرفق صور إن وجد'
          ],
          ['غرفة نوم', 'مطبخ', 'صالة', 'حمام', 'أرفق صور إن وجد'],
          ['غرفة', 'أكثر عن غرفة', 'توقف عن العمل نهائيا', 'أرفق صور إن وجد'],
          [
            'هواء ملوث',
            'تبريد منخفض',
            'تشغيل بعد فترة طويلة',
            'خدمة دورية',
            'أرفق صور إن وجد'
          ],
          [
            'تركيب دكتات جديدة',
            'تركيب وحدة جديدة',
            'تغيير مكان الوحدة',
            'أرفق صور إن وجد'
          ],
        ],
        [
          // Electrical
          [
            'مكسور ولا يعمل',
            'عطلان ولا يعمل',
            'تصميم وموديل افضل',
            'يعمل أحيانا ويتوقف',
            'أرفق صور إن وجد'
          ],
          [
            'مكسور ولا يعمل',
            'عطلان ولا يعمل',
            'تصميم وموديل افضل',
            'يعمل أحيانا ويتوقف',
            'أرفق صور إن وجد'
          ],
          ['غرفة نوم', 'مطبخ', 'صالة', 'حمام', 'أرفق صور إن وجد'],
          [
            'لا يوجد تسخين',
            'تسريب ماء',
            'تسخين عالي',
            'صدء وانسدادات',
            'أرفق صور إن وجد'
          ],
          [
            'إضاءة صفراء',
            'إضاءة بيضاء',
            'أضاءة حلزونية بيضاء',
            'أل أي دي',
            'أرفق صور إن وجد'
          ],
          ['تصليح', 'تركيب جديد', 'تغير موقع الوحدة', 'أرفق صور إن وجد'],
        ],
        [
          // Plumbing
          [
            'لا يعمل أويوجد انسداد',
            'صوت مزعج',
            'ضغط منخفض',
            'تسريب مياة',
            'أرفق صور إن وجد'
          ],
          ['غرفة نوم', 'مطبخ', 'صالة', 'حمام', 'أرفق صور إن وجد'],
          ['مكسور', 'انسداد', 'جودة افضل', 'تسريب مياة', 'أرفق صور إن وجد'],
          [
            'تنظيف دوري',
            'تنظيف بعد انتهاء البناء',
            'لم يتم التنظيف لفترة طويلة',
            'المياة غير نظيفة وبها رائحة',
            'أرفق صور إن وجد'
          ],
          ['إصلاح', 'تركيب جديد', 'أرفق صور إن وجد'],
        ],
        [
          // Cleaning
          [
            'تنظيف دوري',
            'تنظيف قبل المناسبات',
            'تنظيف بعد انتهاء من المناسبات',
            'أرفق صور إن وجد'
          ],
          ['بلاط السيراميك', 'رخام', 'طابوق', 'أرفق صور إن وجد']
        ]
      ];

  @override
  List<FAQ> get faq => [
        new FAQ(' ما هي الخدمات التي نوفرها؟', '''
نحن نوفر خدمات الصيانة من فئات متنوعة منها : اجهزة التكييف, أنابيب المياه, الكهرباء, تنظيف المنزل. لمزيد من التفاصيل يرجى زيارة. 
'''),
        new FAQ('كيف أقوم بحجز خدمة؟', '''
يمكن للعملاء حجز خدمة من خلال الخطوات التالية:
حجز من خلال تطبيقات الموبايل 
اتصال على الرقم +971503070781
نوصى بتحميل و استخدام برنامجنا في نظامين الاندرويد و الاي او اس للحصول على أفضل تجربة للمستخدم
'''),
        new FAQ('هل يمكنني جدولة الخدمة لتاريخ أو وقت لاحق؟', '''
العملاء يستطيعون حجز جدول الخدمة 24 ساعة خلال أوقات الدوام للمكتب ( 8 صباحا إلى 6 مساءا) في أيام العمل من السبت إلى الخميس يمكن جدولة مثل هذه الحجوزات لمدة تصل إلى شهرمقدما.
'''),
        new FAQ(
            'هل الخدمات متاحة بعد أوقات العمل أو يوم الجمعة أوعطلة رسمية؟', '''
نعم, جدول خدماتنا متاحة في يوم الجمعة أو عطلة رسمية, ولكن سيكون هناك رسوم إضافية قيمتها 200 درهم.
'''),
        new FAQ('ما هي خدمة نفس اليوم الموجود في تطبيق الهاتف؟', '''
نحن نوفر خدمات عاجلة " نفس اليوم " لأي عميل لديه أوقات مرنه و يحتاج الخدمة عاجلة في نفس اليوم. خدمة نفس اليوم لا تأتي بأوقات محددة ولكن خيار أقرب وقت ممكن التواجد في غضون الساعة 8 صباحا حتى 6 مساءا في نفس اليوم ويمكن حجز الخدمة عن طريق تطبيق المتاح من الشركةخلال 12 ساعة.
'''),
        new FAQ('هل تقدمون العقود؟', '''
نعم, نحن نقدم عقود صيانة سنوية ولدينا 4 خيارات منها اقتصاد و اساسي و ممتاز و حزمة مخصصة حسب حاجة العميل, تستطيع الحصول على تفاصيل من تطبيق الهاتف أو الاتصال على الرقم +971503070781  
'''),
        new FAQ('يرجى توضيح ضمان خدمة 7 أيام؟', '''
لكل خدمة نقدمها, نقدم ضمان خدمة لمدة 7 أيام و سوف نعود و نحاول إصلاحه مجانا في حال المشكلة في الأجزاء أو مواد أي عائد على ذلك يعتمد على الضمان الذي يأتي من المورد. عموما الأجزاء المستقلة لا تأتي مع الضمان عندما نشتريه أيضا ضمان خدمتنا هو لإصلاح و التركيب فقط. 
'''),
        new FAQ('كيف يمكنني الوصول إلى الفني المخصص لي بعد تعيينه لي؟', '''
 مجرد تعيين أحد لعميل ، يمكن للعميل الاتصال بالمشرف على الهاتف عن طر��ق الاتصال بالرقم المقدم في تطبيق الجوال. هذا يتجنب الازعاج من الادخار للأرقام المهنية في كل مرة تقوم فيها بخدمة الصيانة المنزلية. لا يوجد اتصال مباشر ممكّن بين الفني والعميل.

'''),
        new FAQ('هل يمكنني إلغاء الحجز؟', '''
لإلغاء الحجز ، يحتاج العميل إما إلى الاتصال أو إلغاء الحجز من الت��بيق ، من خلال النقر على زر الإلغاء. للحصول على تفاصيل حول سياسة الإلغاء ، يرجى الرجوع إلى سياستنا.
'''),
        new FAQ('هل يمكنني إعادة جدولة الحجز؟', '''
يمكنك إعادة جدولة خدمة ، بعد مناقشة مع المشرف المعين للفني.
'' '
'''),
        new FAQ('؟ كيف ومتى أدفع مقابل الخدمة', '''
يمكنك الدفع مقابل الخدمة عن طريق بطاقة الائتمان ، أو تحويل الحساب أو نقدًا عند الانتهاء من وظيفتك أو مقدمًا إذا كانت الوظيفة تتطلب دفعة مسبقة. الدفع المسبق مطلوب بشكل عام للوظائف التي تحتاج إلى شراء قطع الغيار والمواد.
'''),
        new FAQ('كيف يمكنني ترك تعليق أو رفع شكوى؟', '''
باعتبارك عميلاً ، يمكنك تقييم وكتابة تعليق للخدمة التي تلقيتها مباشرةً من تطبيق الجوّال. بدلاً من ذلك ، يمكنك الاتصال بنا أو مراسلتنا على أيٍّ من تفاصيل الاتصال أو عنصر الدعم في تطبيق الجوال.
'''),
      ];
}

class $en extends Localization {
  const $en();

  @override
  String get send => 'SEND';

  @override
  String get reSend => 'RESEND';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get otp => 'OTP';

  @override
  String get verify => 'VERIFY';

  @override
  String get requiredString => 'This field is required!';

  @override
  String get verification => 'Phone Number Verification';

  @override
  String get receiveHelp => 'Didn\'t receive the code?';

  @override
  String get services => 'SERVICES';

  @override
  String get orders => 'ORDERS';

  @override
  String get settings => 'SETTINGS';

  @override
  String get ourServices => 'Our Services';

  @override
  String get contactUs => 'Contract Us';

  @override
  String get call => 'CALL';

  @override
  String get support =>
      'If you have any questions, please call us, or send an email to support@eletec.ae';

  @override
  String get address => 'Address';

  @override
  String get contract => 'Contract';

  @override
  String get faqs => 'Faqs';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get logout => 'LOGOUT';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get avatar => 'Avatar';

  @override
  String get submit => 'SUBMIT';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get cancel => 'Cancel';

  @override
  String get userProfile => 'User Profile';

  @override
  String get joinUs => 'Join Us ?';

  @override
  String get email => 'Email';

  @override
  String get code => 'Code';

  @override
  String verfiy(bool b) => b ? 'verified' : 'unverified';

  @override
  List<String> get contractOption =>
      ['Economy', 'Standard', 'Premium', 'Customized'];

  @override
  List<String> get orderStatus => [
        'New',
        'Confirm',
        'Complete',
        'Pending',
        'Cancel',
        'Delete',
      ];

  @override
  List<String> get serviceType => [
        'AC',
        'Electrical',
        'Plumbing',
        'Cleaning',
      ];

  @override
  List<List<String>> get mainInfo => [
        [
          //AC
          'AC cooling repair',
          'AC noise repair',
          'AC digital controller installation',
          'AC controller repair',
          'AC tripping repair',
          'AC leakage repair',
          'AC service',
          'Other custom job e.g new AC unit installation'
        ],
        [
          //Electrical
          'Light fixture repair',
          'Power outlets & Switches repair',
          'Light fixture installation',
          'Water heater repair',
          'Other custom job e.g LED installation'
        ],
        [
          //Plumbing
          'Water pump or motor repair',
          'Water leakage repair',
          'Small fitting (e.g.faucet) repair',
          'Water tank cleaning',
          'Other custom job e.g outdoor plumbing'
        ],
        [
          //Cleaning
          'General cleaning',
          'Floor cleaning or pilishing'
        ]
      ];

  @override
  List<List<List<String>>> get subInfo => [
        [
          //AC
          [
            'Low cooling',
            'Too much cooling',
            'No cooling',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bed Room',
            'Kitchen',
            'Living Room',
            'Bath Room',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Reduce electricity bill',
            'Convenience of the remote',
            'Better control over temperature',
            'Display of the controller',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bed Room',
            'Kitchen',
            'Living Room',
            'Bath Room',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Low cooling and no other reasons',
            'Higher electricity bills',
            'Frequent breakdowns',
            'Reduced life of the compressor',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bed Room',
            'Kitchen',
            'Living Room',
            'Bath Room',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Dirty air',
            'Low cooling',
            'Using after a long time',
            'Just regular service',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'New AC unit installation',
            'AC unit replacement',
            'AC unit relocation',
            'Other(Provide in Instruction Box / attached photo)'
          ],
        ],
        [
          // Electrical
          [
            'Broken',
            'Not working',
            'Better design',
            'Tripping',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Broken',
            'Not working',
            'Better design',
            'Tripping',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bedroom',
            'Kitchen',
            'Living Room',
            'Bathroom',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'No or slow heating',
            'Leaking',
            'Overheating',
            'Rusty or discolored water',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Yellow Light',
            'White Ligth',
            'Spiral bright white',
            'LED',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Repair',
            'New installation',
            'Fitting relocation',
            'Other(Provide in Instruction Box / attached photo)'
          ],
        ],
        [
          // Plumbing
          [
            'Not starting or jammed',
            'Too noisy',
            'Low or no pressure',
            'Leaking',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Bedroom',
            'Kitchen',
            'Living Room',
            'Bathroom',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Broken',
            'Clogged',
            'Better quality',
            'Leaking',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Regular cleaning',
            'Post construction cleaning',
            'Not cleaned for too long',
            'Water dirty or smelling',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Repair',
            'New installation',
            'Other(Provide in Instruction Box / attached photo)'
          ],
        ],
        [
          // Cleaning
          [
            'Regular cleaning',
            'Pre Party cleaning',
            'Post Party cleaning',
            'Other(Provide in Instruction Box / attached photo)'
          ],
          [
            'Ceramic Tiles',
            'Marble',
            'Brick',
            'Other(Provide in Instruction Box / attached photo)'
          ]
        ]
      ];

  @override
  List<FAQ> get faq => [
        new FAQ('What services do we offer?', '''
We offer over maintenance services within the following service categories - AC, Plumbing, Electrical, House Cleaning, For more details, kindly visit www.eletec.ae .
'''),
        new FAQ('How do I book a service?', '''
Customers can book a service using the following methods –
1)Book from our iOS and Android mobile apps.
2)Or give us a call +971 50 307 0781.
We recommend downloading and using our Android and iOS mobile apps, for the best user end-to-end experience.
'''),
        new FAQ('Can I schedule a service for a later date/time?', '''
Customers can book a Scheduled Service (> 24 hours) offered during standard office hours (8 am to 6 pm) on all working days from Sat to Thu. Such bookings can be scheduled for up to a month in advance. 
'''),
        new FAQ(
            'Are the services available after office hours or Friday or Public Holiday?',
            '''
Yes. Our Scheduled Services are offered on Friday or Public Holidays. But there will be a AED200 charge.
'''),
        new FAQ('What is a Same Day Service on the mobile app?', '''
We offer Same Day Services, for anyone who is flexible on the timing but wants the Service within the day. The same day service does not come with a fixed arrival time commitment but with earliest availability option, within office hours (8 am to 6 pm) on the same day, possibility. You can select on mobile app, to book a Same Day Service. Also, note the Same Day service can only be booked before 12 noon.
'''),
        new FAQ('Do we offer contracts?', '''
Yes, we have contracts for Annual Maintenance Contracts, which we have 4 options (Economy, Standard, Premium, and Customized Package) as per the client needs. You can find the details in our mobile app, or you can or give us a call +971 50 307 0781.
'''),
        new FAQ('Please explain the 7 Day Service Warranty', '''
For every service we deliver, we offer a 7-day service warranty which means that if what we fixed is reported faulty again within 7 calendar days, we will come back and try to fix it for free. In case the issue is with the parts and materials, any return on that will be dependent on the warranty that comes from the supplier. Generally parts do not come with a warranty when bought standalone. Also, our Service Warranty is for repair and installation jobs only.
'''),
        new FAQ(
            'How can I reach my assigned Technician after he has been assigned to me?',
            '''
Once a Genie has been assigned to a customer, a customer can call the Supervisor of the by calling the number provided in the mobile app. This avoids the hassle of saving numbers for a professional every time you take a home maintenance service. There is no direct calling enabled between the technician and the customer.
'''),
        new FAQ('Can I cancel a booking?', '''
To cancel a booking, a customer needs to either call or cancel the booking from the app, by clicking on the delete button. For details on cancellation policy, please refer our policy.
'''),
        new FAQ('Can I reschedule a booking?', '''
You can reschedule a service, following a discussion with the assigned Supervisor of the technician.
'''),
        new FAQ('How and when do I pay for a service?', '''
You can pay for a service by a credit card/ debit card, account transfer or in cash upon completion of your job or as advance if the job requires an advance payment. Advance payment is generally required for jobs which need procurement of parts and materials.
'''),
        new FAQ('How can I leave feedback or raise a complaint?', '''
As a customer, you can evaluate or leave a feedback from the mobile app: Bookings -> Select booked service -> Below you will find Evaluation, select the necessary option from Not Satisfied to Very Satisfied and you can optional write you comment and click Save.
'''),
      ];
}

class GeneratedLocalizationsDelegate
    extends LocalizationsDelegate<Localization> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale("en", ""), Locale("ar", "")];
  }

  LocaleListResolutionCallback listResolution(
      {Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution(
      {Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<Localization> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "ar":
          Localization.current = const $ar();
          return SynchronousFuture<Localization>(Localization.current);
        case "en":
          Localization.current = const $en();
          return SynchronousFuture<Localization>(Localization.current);
        default:
        // NO-OP.
      }
    }
    Localization.current = const Localization();
    return SynchronousFuture<Localization>(Localization.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported,
      bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry &&
            (supportedLocale.countryCode == null ||
                supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
    ? null
    : l.countryCode != null && l.countryCode.isEmpty
        ? l.languageCode
        : l.toString();
