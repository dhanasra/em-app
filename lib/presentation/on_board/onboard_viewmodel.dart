
import 'package:flutter/cupertino.dart';

import '../../resources/assets_manager.dart';
import '../../resources/string_manager.dart';
import '../base/base_view_model.dart';
import 'cubit/pageview_cubit.dart';
import 'models/slider_object.dart';

class OnBoardViewModel extends BaseViewModel {

  OnBoardViewModel._internal(){ start(); }
  static final _instance = OnBoardViewModel._internal();
  factory OnBoardViewModel() => _instance;

  late final int currentIndex;
  late final List<SliderObject> list;
  late final PageViewCubit cubit;
  late final PageController pageController;

  @override
  void start() {

    cubit = PageViewCubit(0);
    currentIndex = 0;
    list = const <SliderObject>[
      SliderObject(AppStrings.onBoardingSubtitle1, ImageAssets.onBoarding1),
      SliderObject(AppStrings.onBoardingSubtitle2, ImageAssets.onBoarding2),
      SliderObject(AppStrings.onBoardingSubtitle3, ImageAssets.onBoarding3)
    ];

    pageController = PageController(initialPage: 0);

  }

  void onPageChange(int index)=>cubit.onPageChange(index.toDouble());

  @override
  void dispose() {
    cubit.close();
    pageController.dispose();
  }
}