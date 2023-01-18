import 'package:em/app/app_routes.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseListViewModel extends BaseViewModel {

  ExpenseListViewModel._internal(){ start(); }
  static final _instance = ExpenseListViewModel._internal();
  factory ExpenseListViewModel() => _instance;

  late User user;

  @override
  void start() {
    user = FirebaseAuth.instance.currentUser!;
  }

  void onAddOrRemoveClick(context, bool isIncome){
    Navigator.of(context).pushNamed(Routes.expenseAdd, arguments: isIncome);
  }

  void onDeleteItem(BuildContext context, String id){
    context.read<ExpenseBloc>().add(
      RemoveExpense(id: id)
    );
  }

  @override
  void dispose() {
    
  }

}