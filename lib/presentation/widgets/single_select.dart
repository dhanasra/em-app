import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';

class SingleSelect extends StatefulWidget {
  final List<String>? items;
  final Map? itemIconMap;
  final String? preSelected;
  final String? label;
  final ValueChanged onChanged;

  const SingleSelect({
    super.key,
    this.items,
    this.itemIconMap,
    this.label,
    this.preSelected,
    required this.onChanged
  });

  @override
  State<SingleSelect> createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {

  dynamic selected;

  @override
  void initState() {
    selected = widget.preSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(child: DropdownButton2(
      items: widget.items!=null 
        ? widget.items!.map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e)
          )).toList()
        : widget.itemIconMap!.keys.map(
          (e) => DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                Icon(widget.itemIconMap![e], size: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(e),
                )
              ],
            ))
          ).toList(),
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
        borderRadius: BorderRadius.circular(AppSize.s8),
        border: Border.all(
          color: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.color,
          width: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.width
        )
      ),
      style: getBodyText1Style(context),
      dropdownMaxHeight: 250,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 3),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
    ));
  }
}