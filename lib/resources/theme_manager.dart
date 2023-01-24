import 'package:flutter/material.dart';

import 'style_manager.dart';
import 'values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';


const String THEME_LIGHT = "THEME_LIGHT";
const String THEME_DARK = "THEME_DARK";
const String THEME_GREY = "THEME_GREY";
const String THEME_COLORFUL = "THEME_COLORFUL";

ThemeData getApplicationTheme(String theme){

  Color white = ColorManger.white;
  Color textColor = ColorManger.darkGrey;
  Color darkPrimary = ColorManger.darkPrimary;
  Color shadowColor = ColorManger.grey;
  Color splashColor = ColorManger.lightGrey;
  Color modalWidgetsBGColor = ColorManger.white;
  Color cardColor = ColorManger.white;
  Color canvasColor = ColorManger.lightGrey;

  switch(theme){
    case THEME_DARK : {
      white = ColorManger.black;
      textColor = ColorManger.white;
      shadowColor = ColorManger.grey;
      canvasColor = ColorManger.black2;
      darkPrimary = ColorManger.grey1;
      modalWidgetsBGColor = ColorManger.black2;
      splashColor = ColorManger.darkGrey;
      cardColor = ColorManger.black2;
    }
    break;
    case THEME_GREY : {
      white = ColorManger.grey;
      textColor = ColorManger.darkGrey;
      darkPrimary = ColorManger.grey2;
    }
    break;
    case THEME_COLORFUL : {
      white = ColorManger.primary2;
      textColor = ColorManger.white;
      darkPrimary = ColorManger.darkPrimary2;
    }
  }

  return ThemeData(
    // main colors of the app
    primaryColor: ColorManger.primary,
    primaryColorLight: ColorManger.primaryOpacity70,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey1,
    scaffoldBackgroundColor: white,
    cardColor: cardColor,
    canvasColor: canvasColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorManger.grey,
        primary: darkPrimary,
    ),
    primarySwatch: ColorManger.getSwatch(color: ColorManger.primary),
    unselectedWidgetColor: ColorManger.grey1,
    //ripple color
    splashColor: splashColor,
    // card view theme
    cardTheme: CardTheme(
      color: white,
      shadowColor: shadowColor,
      elevation: AppSize.s4
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: ColorManger.white,
      textStyle: getMediumStyle(color: ColorManger.black, fontSize: FontSize.s16),
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: white,
      actionsIconTheme: IconThemeData(color: ColorManger.grey),
      foregroundColor: textColor,
      elevation: 0,
      shadowColor: shadowColor,
      titleTextStyle: TextStyle(
        height: 1.5,
        color: textColor,
        fontSize: FontSize.s20,
        fontWeight: FontWeightManager.regular
      ),
      toolbarTextStyle: getRegularStyle(color: ColorManger.primary, fontSize: FontSize.s12)
    ),
    shadowColor: shadowColor,
    // button theme
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: ColorManger.grey1,
      buttonColor: ColorManger.primary,
      splashColor: ColorManger.primaryOpacity70
    ),
    
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: getRegularStyle(color: white, fontSize: FontSize.s14),
        backgroundColor: ColorManger.darkPrimary,
        minimumSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s4),
          side: BorderSide(color: darkPrimary, width: 1)  
        )
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(45),
        textStyle: getRegularStyle(color: darkPrimary, fontSize: FontSize.s14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s4),
          side: BorderSide(color: darkPrimary, width: 2)  
        )
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          color: darkPrimary,
          fontWeight: FontWeightManager.semiBold,
          fontSize: FontSize.s16
        )),
        foregroundColor: MaterialStateProperty.all(ColorManger.darkPrimary)
      ),
    ),
    // text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(color: textColor, fontSize: FontSize.s16),
      headline2: getSemiBoldStyle(color: textColor, fontSize: FontSize.s26),
      headline3: getBoldStyle(color: textColor, fontSize: FontSize.s22),
      headline4: getBoldStyle(color: textColor, fontSize: FontSize.s24),
      headline5: getBoldStyle(color: textColor, fontSize: FontSize.s26),
      headline6: getSemiBoldStyle(color: textColor, fontSize: FontSize.s18),
      subtitle1: TextStyle(
        height: 1.5,
        color: textColor,
        fontSize: FontSize.s17,
        fontWeight: FontWeightManager.regular
      ),
      subtitle2: getSemiBoldStyle(color: textColor, fontSize: FontSize.s16),
      caption: TextStyle(
        height: 1.5,
        color: textColor
      ),
      bodyText1: TextStyle(
        height: 1.5,
        color: textColor
      ),
      bodyText2: TextStyle(
        height: 1.3,
        color: textColor
      )
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s20),
          topRight: Radius.circular(AppSize.s20),
        )
      ),
      modalElevation: AppSize.s4,
      modalBackgroundColor: modalWidgetsBGColor,
      backgroundColor: Colors.black45
    ),
    dialogTheme: DialogTheme(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(AppSize.s20) )
      ),
      elevation: 2,
      backgroundColor: modalWidgetsBGColor
    ),
    dividerColor: shadowColor,

    tabBarTheme: TabBarTheme(
      unselectedLabelColor: shadowColor,
      labelPadding: const EdgeInsets.symmetric(vertical: 6),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: ColorManger.darkPrimary,
        boxShadow: [
          BoxShadow(
            color: ColorManger.darkPrimary.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1), 
          ),
        ]
      ),
      labelStyle: TextStyle(
        height: 1.5,
        color: textColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular
      ),
    ),
    
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      hintStyle: TextStyle(
        color: shadowColor,
        fontWeight: FontWeightManager.medium
      ),
      labelStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeightManager.medium
      ),
      floatingLabelStyle: TextStyle(
        color: textColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular
      ),
      prefixStyle: TextStyle(
        color: darkPrimary,
        fontSize: FontSize.s18,
        fontWeight: FontWeightManager.regular
      ),
      errorStyle: getRegularStyle(color: ColorManger.error),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.grey, width: 0.5),
        borderRadius: BorderRadius.circular(AppSize.s8)
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.grey, width: 0.5),
        borderRadius: BorderRadius.circular(AppSize.s8)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.grey, width: 0.5),
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),
      errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),
    ),

    

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorManger.primary,
      unselectedItemColor: ColorManger.grey,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 20,
    )
  );


}