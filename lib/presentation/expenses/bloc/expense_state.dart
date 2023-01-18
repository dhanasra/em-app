part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class Loading extends ExpenseState {}

class ExpenseAdded extends ExpenseState {}

class ExpenseRemoved extends ExpenseState {}

class ExpensesFetched extends ExpenseState {
  final List<Expense> expenses;

  ExpensesFetched({
    required this.expenses
  });
}