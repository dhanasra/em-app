import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app_routes.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import 'models/slider_object.dart';
import 'onboard_viewmodel.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  late final OnBoardViewModel _viewModel;

  @override
  void initState() {
    _viewModel = OnBoardViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Text(AppStrings.appName, style: getBoldStyle(color: ColorManger.primary, fontSize: FontSize.s26),).tr(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                items: const [
                  DropdownMenuItem(child: Text("English"))
                ], 
                onChanged: (val){}
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _viewModel.pageController,
                  itemCount: _viewModel.list.length,
                  onPageChanged: _viewModel.onPageChange,
                  itemBuilder: (_,index){
                    return OnBoardingPage(object: _viewModel.list[index]);
                  }
              )
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical : AppPadding.p8),
            child: BlocBuilder(
              bloc: _viewModel.cubit,
              builder: (_,index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  _viewModel.list.map((e){
                    return Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Icon(
                        Icons.circle,
                        color: _viewModel.list.indexOf(e)== index ?  ColorManger.black : ColorManger.grey,
                        size: _viewModel.list.indexOf(e)== index ? AppSize.s12 : AppSize.s10),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p32),
            child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(Routes.welcome);
                },
                child: const Text(AppStrings.continueCaps).tr()
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}

class OnBoardingPage extends StatelessWidget {
  final SliderObject object;
  const OnBoardingPage({Key? key, required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 320
            ),
            child: SvgPicture.asset(object.image),
          )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p24 ),
          child: Text(
            object.subTitle, textAlign: TextAlign.center, style: getSubtitle1Style(context)).tr(),
        ),
      ],
    );
  }
}


