import 'package:flutter/material.dart';

const String ENGLISH = "en";
const String TAMIL = "ta";
const String MALAYALAM = "ml";
const String KANADAM = "kn";
const String TELUGU = "te";
const String HINDI = "hi";

const String ASSETS_PATH_LOCALIZATIONS = "assets/translation";

const Locale ENGLISH_LOCALE = Locale(ENGLISH);
const Locale TAMIL_LOCALE = Locale(TAMIL);
const Locale MALAYALAM_LOCALE = Locale(MALAYALAM);
const Locale KANADAM_LOCALE = Locale(KANADAM);
const Locale TELUGU_LOCALE = Locale(TELUGU);
const Locale HINDI_LOCALE = Locale(HINDI);

const List appLanguages = [
  ENGLISH, TAMIL, MALAYALAM, KANADAM, TELUGU, HINDI
];
const List<Locale> appLocales = [
  ENGLISH_LOCALE, TAMIL_LOCALE, MALAYALAM_LOCALE, KANADAM_LOCALE, TELUGU_LOCALE, HINDI_LOCALE
];

extension LanguageExtension on String {

  Locale getLocale(){
    switch(this){
      case ENGLISH : return ENGLISH_LOCALE;
      case TAMIL : return TAMIL_LOCALE;
      case MALAYALAM : return MALAYALAM_LOCALE;
      case KANADAM : return KANADAM_LOCALE;
      case TELUGU : return TELUGU_LOCALE;
      case HINDI : return HINDI_LOCALE;
      default : return ENGLISH_LOCALE;
    }
  }

  String getLocaleText(){
    switch(this){
      case ENGLISH : return "English";
      case TAMIL : return "தமிழ்";
      case MALAYALAM : return "മലയാളം";
      case KANADAM : return "ಕನ್ನಡ";
      case TELUGU : return "తెలుగు";
      case HINDI : return "हिन्दी";
      default : return "English";
    }
  }


}