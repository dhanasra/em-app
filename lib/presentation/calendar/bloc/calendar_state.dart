part of 'calendar_bloc.dart';

@immutable
abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class ExpensesLoading extends CalendarState {}

class ExpensesLoaded extends CalendarState {
  final List<Expense> expenses;

  ExpensesLoaded({
    required this.expenses
  });
}
