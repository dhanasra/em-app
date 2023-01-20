import 'package:em/app/app_prefs.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/resources/date_manager.dart';
import 'package:em/resources/language_manager.dart';
import 'package:em/utils/constants.dart';
import 'package:em/utils/currency_utils/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSettingsViewModel extends BaseViewModel {

  AppSettingsViewModel._internal();
  static final _instance = AppSettingsViewModel._internal();
  factory AppSettingsViewModel() => _instance;

  late Box settingsBox;
  late bool isDynamicThemeEnabled;
  late String currencyCode;
  late String locale;
  late String dateFormat;
  late CurrencyService currencyService;
  late ValueNotifier<String> localeNotifier;
  late ValueNotifier<bool> dynamicThemeNotifier;
  late ValueNotifier<String> currencyNotifier;
  late ValueNotifier<String> dateFormatNotifier;

  @override
  void start() {
    
    settingsBox = Hive.box('settings');
    isDynamicThemeEnabled = settingsBox.get('dynamic-theme')??false;
    currencyCode = settingsBox.get('currency')??defaultCurrencyCode;
    locale = settingsBox.get(PREFS_KEY_LANG)??ENGLISH;
    dateFormat = settingsBox.get('date-format')??dateFormats[0];
    currencyNotifier = ValueNotifier(currencyCode);
    dynamicThemeNotifier = ValueNotifier(isDynamicThemeEnabled);
    localeNotifier = ValueNotifier(locale.getLocaleText());
    dateFormatNotifier = ValueNotifier(dateFormat);
  }


  @override
  void dispose() {
    
  }
}