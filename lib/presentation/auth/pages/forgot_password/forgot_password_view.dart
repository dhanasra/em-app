import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/auth/pages/forgot_password/forgot_password_viewmodel.dart';
import 'package:em/presentation/auth/widgets/rich_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../bloc/auth_bloc.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  late ForgotPasswordViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ForgotPasswordViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppStrings.forgotPassword.tr()),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (_, state){
          if(state is AuthSuccess){
            print("Success");
          }else if(state is AuthFailure){
            print("failure");
          }
        },
        child: Form(
          key: _viewModel.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p16),
            child: ForgotPasswordFields(viewModel: _viewModel,),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordFields extends StatelessWidget {
  final ForgotPasswordViewModel viewModel;

  const ForgotPasswordFields({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p24),
          child: TextFormField(
          controller: viewModel.emailController,
          validator: (val)=>viewModel.validateEmail(val),
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: AppStrings.emailLabel.tr()
          ),
          style: getSubtitle2Style(context),
        )),

        BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state){
            return ElevatedButton(
              onPressed: state is Loading 
                ? null
                : ()=>viewModel.sendResetPasswordLink(context),
              child: state is Loading 
                ? const SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: CircularProgressIndicator(strokeWidth: 2)) 
                : const Text(AppStrings.sendResetPasswordLink).tr()
            );
          },  
        ),

        const CRichTextSpan()
      ],
    );
  }
}