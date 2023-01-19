import 'package:easy_localization/easy_localization.dart';
import 'package:em/resources/color_manager.dart';
import 'package:em/resources/date_manager.dart';
import 'package:em/resources/font_manager.dart';
import 'package:em/resources/style_manager.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../network/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  final VoidCallback onDelete;
  const ExpenseItem({super.key, required this.onDelete, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
            child: Text(formatDateString(format: fullDate, dateTime: expense.dateTime), style: getCaptionStyle(context))),
          Container(
            color: Theme.of(context).canvasColor,
            margin: const EdgeInsets.only(top: AppMargin.m8, bottom: AppMargin.m18),
            padding: const EdgeInsets.all(AppPadding.p18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                children: [
                  if(expense.paymentMode!=null && expense.paymentMode!.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManger.primary,
                      borderRadius: BorderRadius.circular(AppSize.s2)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
                    child: Text(expense.paymentMode!.tr(), style: getBodyText2Style(context, color: ColorManger.white)),
                  ),
                  if(expense.category!=null && expense.category!.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManger.primary,
                      borderRadius: BorderRadius.circular(AppSize.s2)
                    ),
                    margin: const EdgeInsets.only(left: AppMargin.m12),
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
                    child: Text(expense.category!.tr(), style: getBodyText2Style(context, color: ColorManger.white)),
                  ),
                  const Spacer(),
                  Text("\u20B9 ${expense.amount}", 
                    style: getSubtitle2Style(context, color: expense.isIncome 
                                ? ColorManger.success 
                                : ColorManger.gRed,  
                            fontWeight: FontWeightManager.bold)),
                ]),

                const Divider(height: AppSize.s32,),

                Row(
                  children: [
                    if(expense.remark!=null)
                    Text(expense.remark!, style: getBodyText1Style(context)),
                    
                    const Spacer(),
                    
                    IconButton(
                      splashRadius: AppSize.s20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: onDelete, 
                      icon: const Icon(FontAwesomeIcons.trashCan, size: AppSize.s18,))
                  ],
                ),
              ],
            ),
          )
        ],
    );
  }
}