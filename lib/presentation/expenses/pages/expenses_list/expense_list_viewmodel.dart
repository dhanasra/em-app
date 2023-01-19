import 'package:em/app/app_routes.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../resources/date_manager.dart';

class ExpenseListViewModel extends BaseViewModel {

  ExpenseListViewModel._internal();
  static final _instance = ExpenseListViewModel._internal();
  factory ExpenseListViewModel() => _instance;

  late User user;
  late Box userbox;
  late String balance;
  late Map record;
  late String currentIncome;
  late String currentExpense;
  late String today;

  @override
  void start() {
    user = FirebaseAuth.instance.currentUser!;
    // init userbox.
    userbox = Hive.box('user');
    // getting total balance.
    balance = "\u20B9 ${userbox.get('balance')??0}";
    // getting today's income & expense
    today = getDate(format: fullDate);
    record = userbox.get('record') ?? defaultIncomeRecord;
    currentIncome = "\u20B9 ${record[today]['income']}";
    currentExpense = "\u20B9 ${record[today]['expense']}";
  }

  void onAddOrRemoveClick(context, bool isIncome){
    Navigator.of(context).pushNamed(Routes.expenseAdd, arguments: isIncome);
  }

  void onDeleteItem(BuildContext context, expense){
    context.read<ExpenseBloc>().add(
      RemoveExpense(expense: expense)
    );
  }

  @override
  void dispose() {
    
  }

}