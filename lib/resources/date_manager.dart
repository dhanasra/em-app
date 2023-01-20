
import 'package:easy_localization/easy_localization.dart';


const String day = 'EEEE';
const String date = 'dd';
const String mWYear = 'MMMM, yyyy';
const String fullDate = 'dd MMMM, yyyy ( EEEE )';

List<String> dateFormats = [
  'dd MMM, yyyy ( EEEE )',
  'dd MMM, yy ( EEEE )',
  'dd MM, yyyy ( EEEE )',
  'dd MM, yy ( EEEE )',
  'd MMM, yyyy',
  'dd MMM, yy',
  'dd / MM / yyyy',
  'd / MMM / yy',
  'dd - MM - yyyy',
];

DateTime getToday(){
  var now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

bool get isNight => DateTime.now().hour>18;

String getDate({required String format}){
  return DateFormat(format).format(DateTime.now());
}

String formatDate({required String format, required DateTime dateTime}){
  return DateFormat(format).format(dateTime);
}

String formatDateString({required String format, required String dateTime}){
  return DateFormat(format).format(DateTime.fromMillisecondsSinceEpoch(int.parse(dateTime)));
}
