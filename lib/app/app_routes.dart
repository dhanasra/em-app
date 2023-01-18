import 'package:em/presentation/auth/bloc/auth_bloc.dart';
import 'package:em/presentation/auth/pages/email_signin/email_signin_view.dart';
import 'package:em/presentation/auth/pages/email_signup/email_signup_view.dart';
import 'package:em/presentation/auth/pages/forgot_password/forgot_password_view.dart';
import 'package:em/presentation/auth/pages/reset_password/reset_password_view.dart';
import 'package:em/presentation/auth/pages/welcome/welcome_view.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/presentation/expenses/pages/expense_add/expense_add_view.dart';
import 'package:em/presentation/home/cubit/home_cubit.dart';
import 'package:em/presentation/home/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/on_board/onboard_view.dart';
import '../presentation/splash/pages/splash_view.dart';
import '../resources/string_manager.dart';

class Routes {
  //welcome
  static const String splash = "/";
  static const String onBoard = "/on_board";

  //auth
  static const String welcome = "/welcome";
  static const String emailSignup = "/email_signup";
  static const String emailSignIn = "/email_signin";
  static const String forgotPassword = "/forgot_password";
  static const String resetPassword = "/reset_password";

  static const String home = "/home";

  static const String expenseAdd = "/expense_add";
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
      case Routes.emailSignIn :
        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (_)=>AuthBloc(),
            child: const EmailSignInView()), settings: settings);
      case Routes.forgotPassword :
        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (_)=>AuthBloc(),
            child: const ForgotPasswordView()));
      case Routes.resetPassword : 
        
        Uri? uri = settings.arguments as Uri?;

        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (_)=>AuthBloc()..add(VerifyResetPasswordLink(uri: uri)),
            child: const ResetPasswordView()), settings: settings);
      case Routes.home :
        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (_)=>HomeCubit(),
            child: const HomeView()));
      case Routes.expenseAdd :

        bool isIncome = settings.arguments as bool;

        return MaterialPageRoute(
          builder: (_)=>BlocProvider(
            create: (_)=>ExpenseBloc(),
            child: ExpenseAddView(
              isIncome: isIncome,
            )));
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
