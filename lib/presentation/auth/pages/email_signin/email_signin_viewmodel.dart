import 'package:easy_localization/easy_localization.dart';
import 'package:em/app/app_routes.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/resources/validations_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../bloc/auth_bloc.dart';

class EmailSignInViewModel extends BaseViewModel {

  EmailSignInViewModel._internal(){ start(); }
  static final _instance = EmailSignInViewModel._internal();
  factory EmailSignInViewModel() => _instance;

  late TextEditingController passwordController;
  late ValueNotifier<bool> passwordHide;
  late GlobalKey<FormState> formKey;

  @override
  void start() {
    passwordController = TextEditingController();
    passwordHide = ValueNotifier(true);
    formKey = GlobalKey<FormState>();
  }

  void onForgotPasswordClick(BuildContext context){
    Navigator.of(context).pushNamed(Routes.forgotPassword);
  }

  void loginUser(BuildContext context){

    var emailAddress = ModalRoute.of(context)!.settings.arguments as String;

    FocusScope.of(context).unfocus();
    if(formKey.currentState!.validate()){
      context.read<AuthBloc>().add(
          EmailLogin(
            email: emailAddress,
            password: passwordController.text
          )
      );
    }
  }


  String? validatePassword(String? password){

    if(password==null || password.trim().isEmpty){
      return AppStrings.passwordEmpty.tr();
    }else if(!validatePasswordFormat(password: password)){
      return AppStrings.passwordError.tr();
    }else{
      return null;
    }
  }


  @override
  void dispose() {
    passwordController.dispose();
  }
}