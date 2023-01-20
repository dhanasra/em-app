import 'package:em/resources/font_manager.dart';
import 'package:em/resources/style_manager.dart';
import 'package:em/utils/currency_utils/currencies.dart';
import 'package:flutter/material.dart';

import '../../../utils/currency_utils/currency.dart';
import '../../../utils/currency_utils/helper.dart';

class CurrencyPicker extends StatelessWidget {
  final ValueChanged onSelected;

  const CurrencyPicker({
    super.key,
    required this.onSelected
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: currencies.length,
      itemBuilder: (_, index){
        Currency currency = Currency.from(json: currencies[index]);
        return ListTile(
          leading: Text(CurrencyHelper.currencyToEmoji(currency), style: const TextStyle(fontSize: FontSize.s20),),
          title: Text(currency.name, style: getBodyText2Style(context),),
          trailing: Text(currency.symbol),
          onTap: (){
            onSelected(currency.code);
            Navigator.pop(context);
          },
        );
      });
  }
}