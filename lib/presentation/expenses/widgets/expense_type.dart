import 'package:em/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';

class ExpenseType extends StatefulWidget {
  const ExpenseType({super.key});

  @override
  State<ExpenseType> createState() => _ExpenseTypeState();
}

class _ExpenseTypeState extends State<ExpenseType> {

  late int selected;
  late List<String> items;

  @override
  void initState() {
    selected = 1;
    items = [
      AppStrings.expense,
      AppStrings.income,
      AppStrings.transfer
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          ...List.generate(3, (index){
            return Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected == index 
                        ? Theme.of(context).primaryColor 
                        : Theme.of(context).dividerColor,
                      width: AppSize.s1_5
                    ),
                    color: selected == index 
                        ? Theme.of(context).primaryColor 
                        : Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppSize.s20)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    items[index].tr(),
                    style: getBodyText2Style(context, color: selected == index 
                        ? Theme.of(context).scaffoldBackgroundColor 
                        : null),
                  ),
                ),
              ));
          })
        ],
      );
  }
} 