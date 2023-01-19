import 'package:em/presentation/calendar/bloc/calendar_bloc.dart';
import 'package:em/presentation/calendar/pages/calendar_view.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/presentation/expenses/pages/expenses_list/expense_list_view.dart';
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
        create: (_)=>ExpenseBloc()..add(GetAllExpenses()),
        child: const ExpenseListView(),
      ),
      BlocProvider(
        create: (_)=>CalendarBloc()..add(GetExpensesOfDate(dateTime: getToday())),
        child: const CalendarView()
      ),
      const AppSettingsView()
    ];
  }

  void onPageChange(int index){
    cubit.onPageChange(index);
  }

  void onTap(int index){
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
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