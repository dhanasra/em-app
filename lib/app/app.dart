import 'package:em/presentation/splash/splash_view.dart';
import 'package:em/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'app_routes.dart';

class App extends StatelessWidget {
  
  const App._internal();
  static const _instance = App._internal();
  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(widget: const SplashView(), title: 'EM', buildContext: context);
  }

  Widget getMaterialApp({required Widget widget, required String title, required BuildContext buildContext}){
    return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        home: widget,
        localizationsDelegates: buildContext.localizationDelegates,
        supportedLocales: buildContext.supportedLocales,
        locale: buildContext.locale,
        onGenerateRoute: RouteGenerator.getRoute,
        theme: getApplicationTheme(THEME_LIGHT)
    );
  }
  
}