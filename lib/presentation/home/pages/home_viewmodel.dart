import 'package:em/app/app_routes.dart';
import 'package:em/presentation/calendar/bloc/calendar_bloc.dart';
import 'package:em/presentation/calendar/pages/calendar_view.dart';
import 'package:em/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:em/presentation/dashboard/pages/dashboard_view.dart';
import 'package:em/presentation/settings/pages/app_settings/app_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/date_manager.dart';
import '../../base/base_view_model.dart';
import '../cubit/home_cubit.dart';

class HomeViewModel extends BaseViewModel{

  HomeViewModel._internal();
  static final _instance = HomeViewModel._internal();
  factory HomeViewModel() => _instance;

  late HomeCubit cubit;
  late PageController pageController;
  late int currentIndex;

  List<Widget> getPages(BuildContext context){
    return [
      BlocProvider(
        create: (_)=>DashboardBloc()..add(GetTodayExpenses()),
        child: const DashboardView(),
      ),
      BlocProvider(
        create: (_)=>CalendarBloc()..add(GetExpensesOfDate(dateTime: getToday())),
        child: const CalendarView()
      ),
      Container(),
      const AppSettingsView()
    ];
  }

  void onPageChange(int index){
    cubit.onPageChange(index);
  }

  void onTap(BuildContext context, int index){
    if(index==2){
      Navigator.of(context).pushNamed(Routes.report);
      return;
    }else if(index==3){
      Navigator.of(context).pushNamed(Routes.settings);
      return;
    }
    pageController.jumpToPage(index);
  }

  @override
  void start() {
    cubit = HomeCubit();
    currentIndex = 0;
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {}

}