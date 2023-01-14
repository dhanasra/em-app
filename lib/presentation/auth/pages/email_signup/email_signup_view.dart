import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/auth/pages/email_signup/email_signup_viewmodel.dart';
import 'package:em/presentation/auth/widgets/rich_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../bloc/auth_bloc.dart';

class EmailSignupView extends StatefulWidget {
  const EmailSignupView({super.key});

  @override
  State<EmailSignupView> createState() => _EmailSignupViewState();
}

class _EmailSignupViewState extends State<EmailSignupView> {

  late EmailSignupViewModel _viewModel;

  @override
  void initState() {
    _viewModel = EmailSignupViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppStrings.signup.tr()),
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
            child: EmailSignupFields(viewModel: _viewModel,),
          ),
        ),
      ),
    );
  }
}

class EmailSignupFields extends StatelessWidget {
  final EmailSignupViewModel viewModel;

  const EmailSignupFields({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: viewModel.nameController,
          autofocus: true,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: AppStrings.nameLabel.tr()
          ),
          style: getSubtitle2Style(context),
        ),

        ValueListenableBuilder(
          valueListenable: viewModel.passwordHide, 
          builder: (_,__,___){
            return Padding(
              padding: const EdgeInsets.only(top: AppPadding.p18),
              child: TextFormField(
              controller: viewModel.passwordController,
              autofocus: true,
              obscureText: viewModel.passwordHide.value,
              validator: viewModel.validatePassword,
              decoration: InputDecoration(
                labelText: AppStrings.passwordLabel.tr(),
                suffixIcon: IconButton(
                  splashRadius: AppSize.s20,
                  onPressed: ()=>viewModel.passwordHide.value =!viewModel.passwordHide.value, 
                  icon: Icon(
                    viewModel.passwordHide.value ? Icons.lock : Icons.lock_open, 
                    size: AppSize.s20,))
              ),
              style: getSubtitle2Style(context),
            ));
          }),

        ValueListenableBuilder(
          valueListenable: viewModel.cPasswordHide, 
          builder: (_,__,___){
            return Padding(
              padding: const EdgeInsets.only(top: AppPadding.p18, bottom: AppPadding.p32),
              child: TextFormField(
              controller: viewModel.cPasswordController,
              autofocus: true,
              obscureText: viewModel.cPasswordHide.value,
              validator: viewModel.validateCPassword,
              decoration: InputDecoration(
                labelText: AppStrings.cPasswordLabel.tr(),
                suffixIcon: IconButton(
                  splashRadius: AppSize.s20,
                  onPressed: ()=>viewModel.cPasswordHide.value =!viewModel.cPasswordHide.value, 
                  icon: Icon(
                    viewModel.cPasswordHide.value ? Icons.lock : Icons.lock_open, 
                    size: AppSize.s20,))
              ),
              style: getSubtitle2Style(context),
            ));
          }),

        BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state){
            return ElevatedButton(
              onPressed: state is Loading 
                ? null
                : ()=>viewModel.signupUser(context),
              child: state is Loading 
                ? const SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: CircularProgressIndicator(strokeWidth: 2)) 
                : const Text(AppStrings.continueCaps).tr()
            );
          },  
        ),

        const CRichTextSpan()
      ],
    );
  }
}