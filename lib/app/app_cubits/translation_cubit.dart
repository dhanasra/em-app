
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/language_manager.dart';
import '../app_prefs.dart';

class TranslationCubit extends Cubit<Locale>{

  TranslationCubit():super(ENGLISH_LOCALE);

  var prefs = AppPreferences();

  Future<void> getLocale()async{
    var language = await prefs.getAppLanguage();
    emit(language.getLocale());
  }

  Future<void> changeLocale(BuildContext context, String type)async{
    context.setLocale(type.getLocale());
    await prefs.saveLanguage(type);
    getLocale();
  }


}