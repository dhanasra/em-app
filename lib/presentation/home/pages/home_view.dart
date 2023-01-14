import 'package:easy_localization/easy_localization.dart';
import 'package:em/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/app.dart';
import '../cubit/home_cubit.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = HomeViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        App().closeApp();
        return true;
      },
      child: BlocBuilder<HomeCubit, int>(
        bloc: _viewModel.cubit,
        builder: (_, index){
          return Scaffold(
            body: PageView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                controller: _viewModel.pageController,
                onPageChanged: _viewModel.onPageChange,
                itemBuilder: (_, index)=>_viewModel.getPages(context)[index],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.moneyBills),
                    label: AppStrings.homeBottom1.tr()),
                BottomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.calendarCheck),
                    label: AppStrings.homeBottom2.tr()),
                BottomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.gears),
                    label: AppStrings.homeBottom3.tr()),
              ],
              currentIndex: index,
              onTap: _viewModel.onTap,
            )
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

