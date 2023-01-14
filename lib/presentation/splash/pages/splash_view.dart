
import 'package:em/presentation/splash/bloc/splash_bloc.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_routes.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (_,state)async{
          if(state is ResetPasswordLinkFetched){
            await Navigator.of(context).pushNamed(Routes.resetPassword,arguments: state.actionCode);
          }else if(state is AuthType){
            await Navigator.of(context).pushNamed (state.isLoggedIn ? Routes.home : Routes.onBoard);
          }
        },
        builder: (_, state){
          return Center(
            child: Image.asset(ImageAssets.logo, width: AppSize.s60,),
          );
        },
      ),
    );
  }
}
