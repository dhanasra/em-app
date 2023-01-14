import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/auth/bloc/auth_bloc.dart';
import 'package:em/presentation/auth/pages/welcome/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app/app_routes.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/string_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  late WelcomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = WelcomeViewModel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppStrings.welcome.tr()),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (_, state){
          if(state is EmailState){
            Navigator.of(context).pushNamed(
                state.isExists ? Routes.onBoard : Routes.emailSignup,
                arguments: _viewModel.emailController.text
            );
          }else if(state is AuthFailure){
            
          }
        },
        child: Form(
          key: _viewModel.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p16),
            child: WelcomeFields(viewModel: _viewModel,),
          ),
        ),
      ),
    );
  }
}

class WelcomeFields extends StatelessWidget {
  final WelcomeViewModel viewModel;
  const WelcomeFields({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(child: Text("English"))
          ], 
          decoration: InputDecoration(
            labelText: AppStrings.langLabel.tr()
          ),
          style: getSubtitle2Style(context),
          onChanged: (val){}
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p18, bottom: AppPadding.p32),
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
                : ()=>viewModel.checkLoginType(context),
              child: state is Loading 
                ? const SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: CircularProgressIndicator(strokeWidth: 2)) 
                : const Text(AppStrings.continueCaps).tr()
            );
          },  
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p28),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: AppSize.s100,child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: const Text(AppStrings.orCaps).tr(),
              ),
            const SizedBox(width: AppSize.s100,child: Divider())
          ],
        )),

        Row(
          children: [
            Expanded(
              child: CircleAvatar(
                minRadius: AppSize.s24,
                backgroundColor: ColorManger.gRed,
                foregroundColor: Colors.white,
                child: const Icon(FontAwesomeIcons.google),
              )
            ),
            Expanded(
              child: CircleAvatar(
                minRadius: AppSize.s24,
                backgroundColor: ColorManger.fBlue,
                foregroundColor: Colors.white,
                child: const Icon(FontAwesomeIcons.facebookF),
              )
            ),
            Expanded(
              child: CircleAvatar(
                minRadius: AppSize.s24,
                backgroundColor: ColorManger.iPurple,
                foregroundColor: Colors.white,
                child: const Icon(FontAwesomeIcons.instagram),
              )
            ),
          ],
        ),
        
      ],
    );
  }
}