import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:em/resources/date_manager.dart';
import 'package:em/resources/string_manager.dart';
import 'package:em/resources/style_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class DateFormatPicker extends StatefulWidget {
  final ValueChanged onPicked;
  final String initial;
  const DateFormatPicker({super.key, required this.onPicked, required this.initial});

  @override
  State<DateFormatPicker> createState() => _DateFormatPickerState();
}

class _DateFormatPickerState extends State<DateFormatPicker> {
  late String format;

  @override
  void initState() {
    format = widget.initial;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          CarouselSlider(
            options: CarouselOptions(
              scrollDirection: Axis.vertical,
              viewportFraction: 0.5,
              aspectRatio: 16/9,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, __){
                setState(() {
                  format = dateFormats[index];
                });
              }
            ),
            items: dateFormats.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s2),
                      color: Theme.of(context).focusColor
                    ),
                    child: Text( getDate(format: i) , style: getBodyText2Style(context))
                  );
                },
              );
            }).toList(),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(AppPadding.p18,AppPadding.p24,AppPadding.p18,AppPadding.p18),
          child: ElevatedButton(
            onPressed: (){
              widget.onPicked(format);
              Navigator.pop(context);
            }, 
            child: const Text(AppStrings.setAsDateFormat).tr()),  
        )
      ],
    );
  }
}