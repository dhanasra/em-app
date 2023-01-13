import 'dart:async';

import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoard);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: Center(
        child: Image.asset(ImageAssets.logo, width: AppSize.s60,),
      ),
    );
  }
}
