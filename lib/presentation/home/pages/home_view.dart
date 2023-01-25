import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:em/app/app_routes.dart';
import 'package:em/resources/color_manager.dart';
import 'package:em/resources/values_manager.dart';
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
    _viewModel = HomeViewModel()..start();
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
            extendBody: true,
            body: PageView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                controller: _viewModel.pageController,
                onPageChanged: _viewModel.onPageChange,
                itemBuilder: (_, index)=>_viewModel.getPages(context)[index],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: ()=>Navigator.of(context).pushNamed(Routes.expenseAdd),
              backgroundColor: ColorManger.darkPrimary,
              child: const Icon(FontAwesomeIcons.plus),
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar(
                icons: const [
                  FontAwesomeIcons.house,
                  FontAwesomeIcons.calendar,
                  FontAwesomeIcons.chartBar,
                  FontAwesomeIcons.gear,
                ],
                activeIndex: index,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.softEdge,
                leftCornerRadius: 4,
                rightCornerRadius: 4,
                height: 60,
                inactiveColor: ColorManger.grey,
                activeColor: ColorManger.darkPrimary,
                iconSize: AppSize.s20,
                onTap: (index)=>_viewModel.onTap(context, index)
            ),
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

