import 'package:easy_localization/easy_localization.dart';
import 'package:em/app/app_routes.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/resources/validations_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../bloc/auth_bloc.dart';

class EmailSignupViewModel extends BaseViewModel {

  EmailSignupViewModel._internal(){ start(); }
  static final _instance = EmailSignupViewModel._internal();
  factory EmailSignupViewModel() => _instance;

  String? email;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;
  late ValueNotifier<bool> passwordHide;
  late ValueNotifier<bool> cPasswordHide;
  late GlobalKey<FormState> formKey;

  @override
  void start() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    passwordHide = ValueNotifier(true);
    cPasswordHide = ValueNotifier(true);
    formKey = GlobalKey<FormState>();
  }

  void signupUser(BuildContext context){

    var emailAddress = ModalRoute.of(context)!.settings.arguments as String;

    FocusScope.of(context).unfocus();
    if(formKey.currentState!.validate()){
      context.read<AuthBloc>().add(
          EmailSignUp(
            email: emailAddress,
            password: passwordController.text,
            name: nameController.text
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
    nameController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
  }
}