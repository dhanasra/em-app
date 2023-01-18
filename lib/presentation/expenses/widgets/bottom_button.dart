import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onAddNew;
  const BottomButton({
    super.key,
    required this.onAdd,
    required this.onAddNew
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: AppSize.s1_5
            )
          ]
        ),
        child: Row(
        children: [
          Expanded(
            flex: 6,
            child: GestureDetector(
            onTap: onAddNew,
            child: Container(
              alignment: Alignment.center,
              height: AppSize.s55,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManger.primary
                ),
                color: ColorManger.white,
                borderRadius: BorderRadius.circular(AppSize.s4)
              ),
              child: Text('Save & Add New', style: getSubtitle2Style(context, color: ColorManger.primary),)
            ),
          )),
          Expanded(
            flex: 3,
            child: GestureDetector(
            onTap: onAdd,
            child: Container(
              margin: const EdgeInsets.only(left: AppMargin.m12),
              height: AppSize.s55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManger.primary
                ),
                color: ColorManger.primary,
                borderRadius: BorderRadius.circular(AppSize.s4)
              ),
              child: Text('Save', style: getSubtitle2Style(context, color: ColorManger.white),)
            ),
          )),
        ],
      )
    );
  }
}