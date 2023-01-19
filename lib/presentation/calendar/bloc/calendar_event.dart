part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent {}

class GetExpensesOfDate extends CalendarEvent {
  final DateTime dateTime;
  GetExpensesOfDate({
    required this.dateTime
  });
}


