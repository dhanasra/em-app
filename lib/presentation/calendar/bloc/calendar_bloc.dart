import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../app/di.dart';
import '../../../network/model/expense.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<GetExpensesOfDate>(_onGetExpensesOfDate);
  }

  var expenseBox = instance.get<CollectionBox>(instanceName: 'expenses');

  void _onGetExpensesOfDate(GetExpensesOfDate event, Emitter emit)async{

    emit(ExpensesLoading());

    var expensesMap = await expenseBox.getAllValues();

    // Filter out selected date expenses
    var elements = expensesMap.values.where((element) => ( 
      event.dateTime.add(const Duration(days: 1)).millisecondsSinceEpoch > int.parse(element['id']))  
      && (int.parse(element['id']) > event.dateTime.millisecondsSinceEpoch)).toList();
    
    List<Expense> expenses = [];
    expenses = elements.map((e) => Expense.fromJson(json.decode(json.encode(e)))).toList();  

    emit(ExpensesLoaded(expenses: expenses));
  }
}
