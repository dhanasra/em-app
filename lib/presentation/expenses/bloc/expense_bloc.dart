import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:em/app/di.dart';
import 'package:em/network/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<AddExpense>(_onAddExpense);
    on<GetAllExpenses>(_onGetAllExpenses);
    on<RemoveExpense>(_onRemoveExpense);
  }

  var expenseBox = instance.get<CollectionBox>(instanceName: 'expenses');
  final Box wallet = Hive.box('wallet');

  void _onGetAllExpenses(GetAllExpenses event, Emitter emit)async{
    emit(Loading());
    
    var expensesMap = await expenseBox.getAllValues();
    List<Expense> expenses = [];
    for (var element in expensesMap.values) { 
      Map<String, dynamic> map = json.decode(json.encode(element));
      expenses.add(Expense.fromJson(map));
    }
    emit(ExpensesFetched(expenses: expenses));
  }

  void _onAddExpense(AddExpense event, Emitter emit)async{
    emit(Loading());

    var id = DateTime.now().millisecondsSinceEpoch;
    var amount = double.parse(event.amount);

    // update total income / expense, balance.
    if(event.isIncome){
      var income = wallet.get('income')??0;
      wallet.put('income', amount + income);
    }else{
      var expense = wallet.get('expense')??0;
      wallet.put('income', amount - expense);
    }
    var balance = wallet.get('balance')??0;  
    wallet.put('balance', event.isIncome 
      ? balance + amount
      : balance - amount
    );

    await expenseBox.put(id.toString(),{
      'id' : id,
      'dateTime': event.dateTime,
      'isIncome': event.isIncome,
      'amount': amount,
      'remark': event.remark,
      'category': event.category,
      'paymentMode': event.paymentMode
    });

    emit(ExpenseAdded());
  }

  void _onRemoveExpense(RemoveExpense event, Emitter emit)async{

    var expense = event.expense;

    // init userbox.
    var userbox = Hive.box('user');

    // // update total balance.
    // var balance = userbox.get('balance')??0;
    // await userbox.put('balance', expense.isIncome 
    //   ? balance-double.parse(expense.amount)
    //   : balance+double.parse(expense.amount)
    // );

    // // update today's income & expense
    // var today = getDate(format: fullDate);
    // var record = userbox.get('record') ?? { today : { "income" : 0 , "expense" : 0 } };
    // var currentIncome = record[today]['income'];
    // var currentExpense = record[today]['expense'];
    // expense.isIncome ? currentIncome-=double.parse(expense.amount) : currentExpense-=double.parse(expense.amount);
    // Map<String, dynamic> newRecord = json.decode(json.encode(record));
    // newRecord[today] = { "income" : currentIncome , "expense" : currentExpense };
    // await userbox.put('record', newRecord);

    // await expenseBox.delete(event.expense.id);

    add(GetAllExpenses());
  }
}
