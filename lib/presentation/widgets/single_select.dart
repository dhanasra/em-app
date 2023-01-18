import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';

class SingleSelect extends StatefulWidget {
  final List<String> items;
  final String? preSelected;
  final String? label;
  final ValueChanged onChanged;

  const SingleSelect({
    super.key,
    required this.items,
    this.label,
    this.preSelected,
    required this.onChanged
  });

  @override
  State<SingleSelect> createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {

  String? selected;

  @override
  void initState() {
    selected = widget.preSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(child: DropdownButton2(
      items: widget.items.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
      onChanged: (value) {
        setState(() {
          selected = value;
        });
        widget.onChanged(value);
      },
      hint: widget.label!=null 
        ? Text(
          widget.label!,
          style: Theme.of(context).inputDecorationTheme.hintStyle) 
        : null,
      value: selected,
      buttonPadding: const EdgeInsets.only(right: AppPadding.p12),
      buttonDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(2.5)),
        border: Border.all(
          color: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.color,
          width: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.width
        )
      ),
      style: getSubtitle2Style(context),
      dropdownPadding: const EdgeInsets.symmetric(vertical: 3),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
    ));
  }
}