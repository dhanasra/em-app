import 'package:easy_localization/easy_localization.dart';
import 'package:em/app/app_routes.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/resources/validations_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../bloc/auth_bloc.dart';

class ResetPasswordViewModel extends BaseViewModel {

  ResetPasswordViewModel._internal(){ start(); }
  static final _instance = ResetPasswordViewModel._internal();
  factory ResetPasswordViewModel() => _instance;

  late TextEditingController passwordController;
  late TextEditingController cPasswordController;
  late GlobalKey<FormState> formKey;
  late ValueNotifier<bool> passwordHide;
  late ValueNotifier<bool> cPasswordHide;
  String? actionCode;

  @override
  void start() {
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    passwordHide = ValueNotifier(true);
    cPasswordHide = ValueNotifier(true);
  }

  void onUpdatePassword(BuildContext context){

    FocusScope.of(context).unfocus();
    if(formKey.currentState!.validate()){
      context.read<AuthBloc>().add(
        ResetPassword(
          actionCode: actionCode!,
          newPassword: passwordController.text
        )
      );
    }
  }

  void onCloseClick(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(Routes.splash, (route)=>false);
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

  String? validateCPassword(String? password){

    if(password==null || password.trim().isEmpty){
      return AppStrings.passwordEmpty.tr();
    }else if(password!=passwordController.text){
      return AppStrings.cPasswordError.tr();
    }else if(!validatePasswordFormat(password: password)){
      return AppStrings.passwordError.tr();
    }else{
      return null;
    }
  }


  @override
  void dispose() {
    passwordController.dispose();
    cPasswordController.dispose();
  }
}