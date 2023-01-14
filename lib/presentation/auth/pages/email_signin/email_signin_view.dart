import 'package:easy_localization/easy_localization.dart';
import 'package:em/app/app_routes.dart';
import 'package:em/presentation/auth/pages/email_signin/email_signin_viewmodel.dart';
import 'package:em/presentation/auth/widgets/rich_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../bloc/auth_bloc.dart';

class EmailSignInView extends StatefulWidget {
  const EmailSignInView({super.key});

  @override
  State<EmailSignInView> createState() => _EmailSignInViewState();
}

class _EmailSignInViewState extends State<EmailSignInView> {

  late EmailSignInViewModel _viewModel;

  @override
  void initState() {
    _viewModel = EmailSignInViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppStrings.login.tr()),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (_, state){
          if(state is AuthSuccess){
            Navigator.of(context).pushNamed(Routes.home);
          }else if(state is AuthFailure){
            print("failure");
          }
        },
        child: Form(
          key: _viewModel.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p16),
            child: EmailSignInFields(viewModel: _viewModel,),
          ),
        ),
      ),
    );
  }
}

class EmailSignInFields extends StatelessWidget {
  final EmailSignInViewModel viewModel;

  const EmailSignInFields({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        ValueListenableBuilder(
          valueListenable: viewModel.passwordHide, 
          builder: (_,__,___){
            return TextFormField(
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
            );
          }),

        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p4, bottom: AppPadding.p24),
          child: TextButton(
            onPressed: ()=>viewModel.onForgotPasswordClick(context), 
            child: Text(AppStrings.forgotPassword.tr())
          )
        ),

        BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state){
            return ElevatedButton(
              onPressed: state is Loading 
                ? null
                : ()=>viewModel.loginUser(context),
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