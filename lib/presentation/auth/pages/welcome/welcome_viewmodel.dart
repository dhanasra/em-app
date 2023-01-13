import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/validations_manager.dart';
import '../../../base/base_view_model.dart';

class WelcomeViewModel extends BaseViewModel {

  WelcomeViewModel._internal(){ start(); }
  static final _instance = WelcomeViewModel._internal();
  factory WelcomeViewModel() => _instance;

  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;

  @override
  void start() {
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void checkLoginType(BuildContext context){
    FocusScope.of(context).unfocus();
    if(formKey.currentState!.validate()){
      context.read<AuthBloc>().add(
          CheckIfEmailExists(email: emailController.text)
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