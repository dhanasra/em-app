import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/date_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class DateCard extends StatelessWidget {
  final String balance;
  const DateCard({
    super.key,
    required this.balance
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p14),
      decoration: BoxDecoration(
        color: ColorManger.primary,
        borderRadius: BorderRadius.circular(AppSize.s4)
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(AppSize.s4)
            ),
            child: Text(getDate(format: date)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getDate(format: mWYear), style: getBodyText2Style(context, color: ColorManger.white)),
                Text(getDate(format: day), style: getCaptionStyle(context, color: ColorManger.white))
              ],
          ))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(AppStrings.balance.tr(), style: getCaptionStyle(context, color: ColorManger.white)),
              Text(balance, style: getBodyText2Style(context, color: ColorManger.white))
            ],
          )
        ],
      ),  
    );
  }
}