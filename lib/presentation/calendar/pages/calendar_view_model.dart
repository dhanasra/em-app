import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/presentation/calendar/bloc/calendar_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarViewModel extends BaseViewModel{

  CalendarViewModel._internal();
  static final _instance = CalendarViewModel._internal();
  factory CalendarViewModel() => _instance;

  late DateTime selectedDate;
  
  @override
  void start() {
    selectedDate = DateTime.now();
  }

  void onDateClicked(BuildContext context, DateTime clickedDate){
    context.read<CalendarBloc>().add(
      GetExpensesOfDate(dateTime: clickedDate)
    );
  }

  @override
  void dispose() {
    
  }

}