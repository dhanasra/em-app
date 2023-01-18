import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/presentation/expenses/pages/expenses_list/expense_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_view_model.dart';
import '../cubit/home_cubit.dart';

class HomeViewModel extends BaseViewModel{

  HomeViewModel._internal(){ start(); }
  static final _instance = HomeViewModel._internal();
  factory HomeViewModel() => _instance;

  late final HomeCubit cubit;
  late final PageController pageController;
  late final int currentIndex;

  List<Widget> getPages(BuildContext context){
    return [
      BlocProvider(
        create: (_)=>ExpenseBloc()..add(GetAllExpenses()),
        child: const ExpenseListView(),
        ),
      Container(),
      Container()
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
  void dispose() {
    cubit.close();
  }

}