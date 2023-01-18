part of 'expense_bloc.dart';

@immutable
abstract class ExpenseEvent {}

class GetAllExpenses extends ExpenseEvent {}

class RemoveExpense extends ExpenseEvent {
  final String id;

  RemoveExpense({
    required this.id
  });
}

class AddExpense extends ExpenseEvent {

  final bool isIncome;
  final String dateTime;
  final String amount;
  final String? remark;
  final String? category;
  final String? paymentMode;

  AddExpense({
    required this.isIncome,
    required this.dateTime,
    required this.amount,
    this.category,
    this.paymentMode,
    this.remark
  });
}
