import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/string_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class ExpenseCard extends StatelessWidget {
  final String credit;
  final String debit;
  const ExpenseCard({
    super.key,
    required this.credit,
    required this.debit
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: AppSize.s2,
          )
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s2)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14, vertical: AppPadding.p12),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.totalIn.tr(), style: getBodyText1Style(context)),
              Text(credit, style: getBodyText1Style(context))
            ],
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(AppPadding.p14, 0, AppPadding.p14, AppPadding.p16),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.totalOut.tr(), style: getBodyText1Style(context)),
              Text(debit, style: getBodyText1Style(context))
            ],
          )),
          const Divider(height: 0,),
          TextButton(onPressed: (){}, child: Text(AppStrings.viewReports.tr()))
        ],
      ),
    );
  }
}