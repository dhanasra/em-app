import 'package:em/network/model/expense.dart';
import 'package:em/resources/date_manager.dart';
import 'package:em/resources/font_manager.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

class TransactItem extends StatelessWidget {
  final Expense expense;
  const TransactItem({
    super.key,  
    required this.expense
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m12),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12, horizontal: AppPadding.p16),
      decoration: BoxDecoration(
        color: ColorManger.lightGrey,
        borderRadius: BorderRadius.circular(AppSize.s8)
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber.shade100,
            child: const Icon(Icons.shopping_bag_outlined, color: Colors.amber,),
          ),
          Expanded(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.category.toString(), style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontSize: 15
                )),
                const SizedBox(height: AppSize.s8),
                Text(expense.paymentMode??'Not Specified', style: Theme.of(context).textTheme.bodyText2!)
              ],
            ),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${expense.isIncome?'':'-'} \u20B9 ${expense.amount}', 
                style: Theme.of(context).textTheme.bodyText1!
                  .copyWith(
                    color: expense.isIncome ? ColorManger.success : ColorManger.error,
                    fontSize: FontSize.s16
                  )),
              const SizedBox(height: 6),
              Text(getTime(expense.dateTime), style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 12
              ))
            ],
          )
        ],
      ),
    );
  }
}