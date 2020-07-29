part of 'i18n.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

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

  String get contactUs => 'Contact Us';

  String get call => 'CALL';

  String get support =>
      'If you have any questions, please call us, or send an email to support@eletec.ae';

  String get address => 'ADDRESS';

  String get contact => 'CONTACT';

  String get faqs => 'FAQS';

  String get language => 'LANGUAGE';

  String get english => 'English';

  String get arabic => 'Arabic';

  String get logout => 'LOGOUT';

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
  String get contactUs => 'Contact Us';

  @override
  String get call => 'CALL';

  @override
  String get support =>
      'If you have any questions, please call us, or send an email to support@eletec.ae';

  @override
  String get address => 'ADDRESS';

  @override
  String get contact => 'CONTACT';

  @override
  String get faqs => 'FAQS';

  @override
  String get language => 'LANGUAGE';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get logout => 'LOGOUT';

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
  String get contactUs => 'Contact Us';

  @override
  String get call => 'CALL';

  @override
  String get support =>
      'If you have any questions, please call us, or send an email to support@eletec.ae';

  @override
  String get address => 'ADDRESS';

  @override
  String get contact => 'CONTACT';

  @override
  String get faqs => 'FAQS';

  @override
  String get language => 'LANGUAGE';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get logout => 'LOGOUT';

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
