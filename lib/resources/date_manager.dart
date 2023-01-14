import 'package:easy_localization/easy_localization.dart';


const String day = 'EEEE';
const String date = 'dd';
const String mWYear = 'MMMM, yyyy';

String getDate({required String format}){
  return DateFormat(format).format(DateTime.now());
}