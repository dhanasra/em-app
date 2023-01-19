import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../resources/date_manager.dart';

class DatePickerView extends StatelessWidget {
  final ValueChanged<DateTime> onDateClicked;
  const DatePickerView({
    Key? key,
    required this.onDateClicked  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SfCalendar(
      view: CalendarView.month,
      headerDateFormat: mWYear,
      appointmentTimeTextFormat: 'HH:mm',
      headerHeight: 50,
      onTap: (calendarTapDetails) => onDateClicked(calendarTapDetails.date!),
      monthViewSettings: const MonthViewSettings(
        showAgenda: false,
        numberOfWeeksInView: 1, 
        dayFormat: 'EEE'
      ),
    );
  }
}
