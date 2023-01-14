import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/resources/validations_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../bloc/auth_bloc.dart';

class ForgotPasswordViewModel extends BaseViewModel {

  ForgotPasswordViewModel._internal(){ start(); }
  static final _instance = ForgotPasswordViewModel._internal();
  factory ForgotPasswordViewModel() => _instance;

  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;

  @override
  void start() {
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void sendResetPasswordLink(BuildContext context){

    FocusScope.of(context).unfocus();
    if(formKey.currentState!.validate()){
      context.read<AuthBloc>().add(
          ForgotPassword(
            email: emailController.text
          )
      );
    }
  }

  String? validateEmail(String? email){

    if(email==null || email.trim().isEmpty){
      return AppStrings.emailEmpty.tr();
    }else if(!validateEmailFormat(email: email)){
      return AppStrings.emailError.tr();
    }else{
      return null;
    }
  }


  @override
  void dispose() {
    emailController.dispose();
  }
}