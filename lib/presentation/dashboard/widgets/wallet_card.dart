import 'package:em/resources/color_manager.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String balance;
  const WalletCard({
    super.key,
    required this.balance
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m20),
      padding: const EdgeInsets.all(AppPadding.p20),
      width: double.infinity,
      height: 130,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Balance', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: ColorManger.white)),
          const SizedBox(height: AppSize.s8),
          Text('\u20B9 $balance', style: Theme.of(context).textTheme.headline2!.copyWith(color: ColorManger.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('My Wallet',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: ColorManger.white)),
              Icon(Icons.arrow_right, color: ColorManger.white,)
            ],
          )
        ],
      ),
    );
  }
}