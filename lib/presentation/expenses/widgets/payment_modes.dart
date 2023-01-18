import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/string_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class PaymentModes extends StatefulWidget {
  final TextEditingController paymentModeController;

  const PaymentModes({
    super.key,
    required this.paymentModeController,
  });

  @override
  State<PaymentModes> createState() => _PaymentModesState();
}

class _PaymentModesState extends State<PaymentModes> {

  late int selected;
  late List<String> items;

  @override
  void initState() {
    selected = 0;
    items = [
      AppStrings.cash,
      AppStrings.online,
      AppStrings.upi
    ];
    widget.paymentModeController.text = AppStrings.cash;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          ...List.generate(3, (index){
            return GestureDetector(
                onTap: (){
                  setState(() {
                    selected = index;
                  });
                  widget.paymentModeController.text = items[selected]; 
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
                  margin: const EdgeInsets.only(right: AppPadding.p12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected == index 
                        ? Theme.of(context).primaryColor 
                        : Theme.of(context).dividerColor,
                      width: 0.5
                    ),
                    color: selected == index 
                        ? Theme.of(context).primaryColor 
                        : Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppSize.s4)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    items[index].tr(),
                    style: getBodyText2Style(context, color: selected == index 
                        ? Theme.of(context).scaffoldBackgroundColor 
                        : null),
                  ),
                ),
              );
          })
        ],
      );
  }
}