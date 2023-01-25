import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class TransactOverview extends StatelessWidget {
  final String income;
  final String outcome;

  const TransactOverview({
    super.key,  
    required this.income,
    required this.outcome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m16),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
                  colors: [
                    Color(0xFF2c3e50),
                    Color(0xFF3498db),
                    Color(0xFF2c3e50),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
      ),
      child: IntrinsicHeight(
        child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(FontAwesomeIcons.arrowDown, color: ColorManger.success,),
                const SizedBox(width: AppSize.s16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Income', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: ColorManger.white)),
                      const SizedBox(height: AppSize.s4),
                      Text('\u20B9 $income', style: Theme.of(context).textTheme.headline6!.copyWith(color: ColorManger.white))
                    ],
                  ),
                )
              ],
            ),
          ),

          Container(color: ColorManger.white,width: 1, margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16)),
          
          Expanded(
            child: Row(
              children: [
                Icon(FontAwesomeIcons.arrowUp, color: ColorManger.error, ),
                const SizedBox(width: AppSize.s16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expense', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: ColorManger.white)),
                      const SizedBox(height: AppSize.s4),
                      Text('\u20B9 $outcome', style: Theme.of(context).textTheme.headline6!.copyWith(color: ColorManger.white))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ))
    );
  }
}