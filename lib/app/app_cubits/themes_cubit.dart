import 'package:em/app/app_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../resources/theme_manager.dart';

class ThemesCubit extends Cubit<String>{

  ThemesCubit():super(THEME_LIGHT);

  var prefs = AppPreferences();

  Future<void> getTheme()async{
    var theme = await prefs.getAppTheme();
    emit(theme);
  }

  Future<void> changeTheme(String theme)async{
    emit(theme);
    await prefs.saveTheme(theme);
  }

  Future<void> switchDynamicTheme(bool isEnabled) async{
    var settingsBox = Hive.box('settings');
    await settingsBox.put('dynamic-theme', isEnabled);
    getTheme();
  }

}