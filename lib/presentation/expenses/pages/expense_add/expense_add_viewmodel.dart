import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/resources/date_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseAddViewModel extends BaseViewModel {

  ExpenseAddViewModel._internal();
  static final _instance = ExpenseAddViewModel._internal();
  factory ExpenseAddViewModel() => _instance;

  late TextEditingController dateController;
  late TextEditingController paymentModeController;
  late TextEditingController categoryController;
  late TextEditingController amountController;
  late TextEditingController remarksController;
  late GlobalKey<FormState> formKey;
  
  late int pickedDateTime;

  late Map<String, IconData> categories;

  @override
  void start() {
    dateController = TextEditingController();
    paymentModeController = TextEditingController();
    categoryController = TextEditingController();
    amountController = TextEditingController();
    remarksController = TextEditingController();
    formKey = GlobalKey<FormState>();

    pickedDateTime = DateTime.now().millisecondsSinceEpoch;

    categories = {
      'Housing': FontAwesomeIcons.house,
      'Transportation': FontAwesomeIcons.bus,
      'Food': FontAwesomeIcons.bowlFood,
      'Utilities': FontAwesomeIcons.piedPiper,
      'Insurance': FontAwesomeIcons.shield,
      'Medical & Healthcare': FontAwesomeIcons.stethoscope,
      'Saving': FontAwesomeIcons.floppyDisk,
      'Investing': FontAwesomeIcons.moneyBill,
      'Debt': FontAwesomeIcons.moneyBill1,
      'Gym': FontAwesomeIcons.fire,
      'Cloths & Shoes': FontAwesomeIcons.shoePrints,
      'Gift': FontAwesomeIcons.gift,
      'Personal': FontAwesomeIcons.person,
      'Movie': FontAwesomeIcons.film,
      'Restarant': FontAwesomeIcons.hotel,
      'Entertainment': FontAwesomeIcons.music,
      'Miscellaneous': FontAwesomeIcons.info
    };

    dateController.text = getDate(format: fullDateMin);
  }

  void onAddClick(BuildContext context, {required bool isIncome}){

    FocusScope.of(context).unfocus();
    if(!formKey.currentState!.validate()) return;
    context.read<ExpenseBloc>().add(
        AddExpense(
          isIncome: isIncome,
          dateTime: pickedDateTime,
          amount: amountController.text,
          category: categoryController.text,
          paymentMode: paymentModeController.text,
          remark: remarksController.text,
        )
    );
  }


  @override
  void dispose() {
    
  }
  
}