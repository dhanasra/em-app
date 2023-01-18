import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/base/base_view_model.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/resources/date_manager.dart';
import 'package:em/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseAddViewModel extends BaseViewModel {

  ExpenseAddViewModel._internal(){ start(); }
  static final _instance = ExpenseAddViewModel._internal();
  factory ExpenseAddViewModel() => _instance;

  late TextEditingController dateController;
  late TextEditingController paymentModeController;
  late TextEditingController categoryController;
  late TextEditingController amountController;
  late TextEditingController remarksController;
  late GlobalKey<FormState> formKey;
  
  late String pickedDateTime;

  late List<String> categories;

  @override
  void start() {
    dateController = TextEditingController();
    paymentModeController = TextEditingController();
    categoryController = TextEditingController();
    amountController = TextEditingController();
    remarksController = TextEditingController();
    formKey = GlobalKey<FormState>();

    pickedDateTime = DateTime.now().millisecondsSinceEpoch.toString();

    categories = [
      AppStrings.investment.tr(),
      AppStrings.emi.tr(),
      AppStrings.inHand.tr(),
      AppStrings.home.tr(),
      AppStrings.travel.tr(),
      AppStrings.flipkart.tr(),
      AppStrings.bonus.tr(),
      AppStrings.rent.tr()
    ];

    dateController.text = getDate(format: fullDate);
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