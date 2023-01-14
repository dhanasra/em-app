import 'package:em/presentation/auth/bloc/auth_bloc.dart';
import 'package:em/presentation/auth/pages/email_signup/email_signup_view.dart';
import 'package:em/presentation/auth/pages/welcome/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/on_board/onboard_view.dart';
import '../presentation/splash/splash_view.dart';
import '../resources/string_manager.dart';

class Routes {
  //welcome
  static const String splash = "/";
  static const String onBoard = "/on_board";

  static const String welcome = "/welcome";
  static const String emailSignup = "/email_signup";
}

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splash : 
        return MaterialPageRoute(builder: (_)=>const SplashView(), settings: settings);
      case Routes.onBoard :
        return MaterialPageRoute(builder: (_)=>const OnBoardView(), settings: settings);
      case Routes.welcome :
        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (_)=>AuthBloc(),
            child: const WelcomeView()), settings: settings);
      case Routes.emailSignup :
        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (_)=>AuthBloc(),
            child: const EmailSignupView()), settings: settings);
      default :
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
      const Scaffold(
        body: Center(
          child: Text(AppStrings.notFound404),
        ),
      )
    );
  }

}
