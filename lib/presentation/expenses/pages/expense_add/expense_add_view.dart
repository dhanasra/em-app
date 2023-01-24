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
    _viewModel = ExpenseAddViewModel()..start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: ColorManger.grey), splashRadius: AppSize.s18),
        title: Text(
          widget.isIncome ? AppStrings.addIncome.tr() : AppStrings.addExpense.tr(), 
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
            color: widget.isIncome ? ColorManger.success : ColorManger.error),),
      ),
      body: BlocListener<ExpenseBloc, ExpenseState>(
        listener: (_, state){
          if(state is ExpenseAdded){
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
          }
        },
        child: DefaultTabController(
          length: 2, 
          child: Column(
            children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                    child: ExpenseAddFields(viewModel: _viewModel)),
                  ),
                BottomButton(
                  onAdd: ()=>_viewModel.onAddClick(context, isIncome: widget.isIncome),
                  onAddNew: ()=>{},
                )
              ],
            )
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
        Container(
          height: 45,
          margin: const EdgeInsets.only(bottom: AppMargin.m32),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: const TabBar(
            tabs: [
              Tab(text: 'Income'),
              Tab(text: 'Expense')
            ],
          )),

        Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subtle(
                context,
                text: 'CATEGORY', 
                child: SingleSelect(
                  itemIconMap: viewModel.categories, 
                  onChanged: (val)=>viewModel.categoryController.text = val,
                  label: AppStrings.selectCategory.tr())
              ),

              subtle(
                context,
                text: 'AMOUNT', 
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
                  style: getBodyText1Style(context))
              ),

              subtle(
                context,
                text: 'DATE', 
                child: DatePickerField(
                  controller: viewModel.dateController,
                  onDatePicked: (pickedDate)=>viewModel.pickedDateTime = pickedDate,  
                )
              ),

              subtle(
                context,
                text: 'NOTES', 
                child: TextFormField(
                  controller: viewModel.remarksController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(),
                  style: getBodyText1Style(context),
                )
              ),

              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p24, bottom: AppPadding.p24),
                child: Text('PAYMENT MODE', style: getBodyText1Style(context, color: ColorManger.darkGrey)).tr(),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p32),
                child: PaymentModes(
                  paymentModeController: viewModel.paymentModeController,
                ),  
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget subtle(BuildContext context,{required String text, required Widget child}){
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p14),
      child: Row(
        children: [
          Container(
            width: 120,
            margin: const EdgeInsets.only(left: 2),
            child: Text(text, style: getBodyText1Style(context, color: ColorManger.darkGrey),).tr(),
          ),
          Expanded(child: child)
        ],
      ),  
    );
  }
}