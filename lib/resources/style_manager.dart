
import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color){
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: fontWeight, color: color);
}

// regular style

TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// light style

TextStyle getLightStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

// medium style

TextStyle getMediumStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

// semi bold style

TextStyle getSemiBoldStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

TextStyle getheadline1Style(context){
  return Theme.of(context).textTheme.headline1!;
}

TextStyle getheadline2Style(context){
  return Theme.of(context).textTheme.headline2!;
}

TextStyle getheadline3Style(context){
  return Theme.of(context).textTheme.headline3!;
}

TextStyle getheadline4Style(context){
  return Theme.of(context).textTheme.headline4!;
}

TextStyle getheadline5Style(context){
  return Theme.of(context).textTheme.headline5!;
}

TextStyle getheadline6Style(context){
  return Theme.of(context).textTheme.headline6!;
}

TextStyle getSubtitle1Style(context){
  return Theme.of(context).textTheme.subtitle1!;
}

TextStyle getSubtitle2Style(context, {Color? color, FontWeight? fontWeight}){
  return Theme.of(context).textTheme.subtitle2!.copyWith(color: color, fontWeight: fontWeight);
}

TextStyle getBodyText1Style(context, {Color? color}){
  return Theme.of(context).textTheme.bodyText1!.copyWith(color: color);
}

TextStyle getBodyText2Style(context, {Color? color}){
  return Theme.of(context).textTheme.bodyText2!.copyWith(color: color);
}

TextStyle getCaptionStyle(context, {Color? color}){
  return Theme.of(context).textTheme.caption!.copyWith(color: color);
}