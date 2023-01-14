import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/auth/pages/reset_password/reset_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../bloc/auth_bloc.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late ResetPasswordViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ResetPasswordViewModel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppStrings.resetPassword.tr()),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state){
          if(state is ResetLinkIsValid){
            _viewModel.actionCode = state.actionCode;
          }else if(state is AuthSuccess){
            print("Success");
          }else if(state is AuthFailure){
            print("failure");
          }
        },
        builder: (_, state){
          return state is ValidatingResetLink 
            ? const Center(child: CircularProgressIndicator())
            : Form(
              key: _viewModel.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p16),
                child: state is ResetLinkIsNotValid 
                  ? NotValidLink(viewModel: _viewModel) 
                  : ResetPasswordFields(viewModel: _viewModel, state: state),
          ),
        );},
      ),
    );
  }
}

class ResetPasswordFields extends StatelessWidget {
  final ResetPasswordViewModel viewModel;
  final Object state;

  const ResetPasswordFields({
    super.key,
    required this.state,
    required this.viewModel
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                : ()=>viewModel.onUpdatePassword(context),
              child: state is Loading 
                ? const SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: CircularProgressIndicator(strokeWidth: 2)) 
                : const Text(AppStrings.continueCaps).tr()
            );
          },  
        ),
      ],
    );
  }
}

class NotValidLink extends StatelessWidget {
  final ResetPasswordViewModel viewModel;
  const NotValidLink({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.resetPasswordErrorC1.tr()
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p16, bottom: AppPadding.p28),
          child: Text(
          AppStrings.resetPasswordErrorC2.tr()
        )),
        ElevatedButton(
          onPressed: ()=>viewModel.onCloseClick(context),
          child: const Text(AppStrings.continueCaps).tr()
        )
      ],
    );
  }
}