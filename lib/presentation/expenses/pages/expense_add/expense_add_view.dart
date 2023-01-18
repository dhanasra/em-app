import 'package:easy_localization/easy_localization.dart';
import 'package:em/app/app_routes.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/presentation/expenses/pages/expense_add/expense_add_viewmodel.dart';
import 'package:em/presentation/expenses/widgets/bottom_button.dart';
import 'package:em/presentation/expenses/widgets/date_picker_field.dart';
import 'package:em/presentation/expenses/widgets/payment_modes.dart';
import 'package:em/presentation/widgets/single_select.dart';
import 'package:em/resources/color_manager.dart';
import 'package:em/resources/string_manager.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/style_manager.dart';

class ExpenseAddView extends StatefulWidget {
  final bool isIncome;
  const ExpenseAddView({super.key, required this.isIncome});

  @override
  State<ExpenseAddView> createState() => _ExpenseAddViewState();
}

class _ExpenseAddViewState extends State<ExpenseAddView> {

  late ExpenseAddViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ExpenseAddViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isIncome ? AppStrings.addExpense.tr() : AppStrings.addIncome.tr(), 
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
            color: widget.isIncome ? ColorManger.error : ColorManger.success),),
        elevation: AppSize.s1_5,
      ),
      body: BlocListener<ExpenseBloc, ExpenseState>(
        listener: (_, state){
          if(state is ExpenseAdded){
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
          }
        },
        child: Column(
        children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: Form(
                  key: _viewModel.formKey,
                  child: ExpenseAddFields(viewModel: _viewModel)),
              )),
            BottomButton(
              onAdd: ()=>_viewModel.onAddClick(context, isIncome: widget.isIncome),
              onAddNew: ()=>{},
            )
          ],
        ),
      ),
    );
  }
}

class ExpenseAddFields extends StatelessWidget {
  final ExpenseAddViewModel viewModel;
  const ExpenseAddFields({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24, horizontal: AppPadding.p4),
      shrinkWrap: true,
      children: [

        DatePickerField(
          controller: viewModel.dateController,
          onDatePicked: (pickedDate)=>viewModel.pickedDateTime = pickedDate,  
        ),

        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p18),
          child: TextFormField(
            controller: viewModel.amountController,
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Amount *',
              prefix: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: Text('\u20B9'),
              )
            ),
            style: getSubtitle2Style(context),
        )),
        
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p18),
          child: SingleSelect(
            items: viewModel.categories, 
            onChanged: (val)=>viewModel.categoryController.text = val,
            label: AppStrings.selectCategory.tr(),
          ) 
        ),

        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p18),
          child: TextFormField(
            controller: viewModel.remarksController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: 'Remark (Item name, Person name, Quantity..)',
            ),
            style: getSubtitle2Style(context),
        )),

        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p24, bottom: AppPadding.p16),
          child: Text('Payment Mode', style: getBodyText1Style(context, color: ColorManger.primary)),
        ),

        PaymentModes(
          paymentModeController: viewModel.paymentModeController,
        )
      ],
    );
  }
}