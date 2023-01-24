import 'package:em/resources/date_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<int> onDatePicked;
  const DatePickerField({
    super.key,
    required this.controller,
    required this.onDatePicked
    });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {

  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: ()=>pickDate(context),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.name,
        enabled: false,
        decoration: const InputDecoration(
          suffixIcon: Icon(FontAwesomeIcons.calendarWeek, size: AppSize.s20)
        ),
        style: getBodyText1Style(context),
      ),
    );
  }

  void pickDate(context)async{

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDatePicked(picked.millisecondsSinceEpoch);
      var pickedDate = formatDate(format: fullDateMin, dateTime: selectedDate);
      widget.controller.text = pickedDate;
    }
  }
}