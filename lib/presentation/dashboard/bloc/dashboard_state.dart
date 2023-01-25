part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  const DashboardState();
}

class DashboardInitial extends DashboardState {}

class TodayExpensesLoading  extends DashboardState {}

class TodayExpensesLoaded extends DashboardState {
  final List<Expense> expenses;
  const TodayExpensesLoaded(this.expenses);
}