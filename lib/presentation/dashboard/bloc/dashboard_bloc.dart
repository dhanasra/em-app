import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:em/network/model/expense.dart';
import 'package:em/resources/date_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../app/di.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<GetTodayExpenses>(_onGetTodayExpenses);
  }

  var expenseBox = instance.get<CollectionBox>(instanceName: 'expenses');

  void _onGetTodayExpenses(GetTodayExpenses event, Emitter emit)async{
    emit(TodayExpensesLoading());

    try{
      
      var expensesMap = await expenseBox.getAllValues();
      
      var today = getToday().millisecondsSinceEpoch;
      var tommorrow = getToday().add(const Duration(days: 1)).millisecondsSinceEpoch;

      List<Expense> expenses = [];

      for (var key in expensesMap.keys) { 
        if(int.parse(key) >= today && int.parse(key) < tommorrow){
          expenses.add(Expense.fromJson(Map.from(expensesMap[key])));
        } 
      }

      emit(TodayExpensesLoaded(expenses));
    }catch(e){
      print(e);
    }
  }

}
