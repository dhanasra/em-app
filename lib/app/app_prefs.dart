
import 'package:em/resources/date_manager.dart';
import 'package:em/resources/language_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../resources/theme_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_THEME = "PREFS_KEY_THEME";

class AppPreferences{

  Future<void> saveLanguage(String lang) async{
    final Box box = Hive.box('settings');
    await box.put(PREFS_KEY_LANG, lang);
  }

  Future<String> getAppLanguage() async{
    final Box box = Hive.box('settings');
    String? language = box.get(PREFS_KEY_LANG);
    if(language !=null && language.isNotEmpty){
      return language;
    }else{
      return ENGLISH;
    }
  }

  Future<void> saveTheme(String theme) async{
    final Box box =  Hive.box('settings');
    await box.put(PREFS_KEY_THEME, theme);
  }

  Future<String> getAppTheme() async{
    final Box box =  Hive.box('settings');
    String? theme = box.get(PREFS_KEY_THEME);

    bool isDynamicThemeEnabled = box.get('dynamic-theme')??false;

    if(isDynamicThemeEnabled && isNight){
      return THEME_DARK;
    }else{
      if(theme !=null && theme.isNotEmpty){
        return theme;
      }else{
        return THEME_LIGHT;
      }
    }
  }

}