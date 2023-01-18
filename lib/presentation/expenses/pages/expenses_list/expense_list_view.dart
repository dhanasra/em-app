import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/expenses/bloc/expense_bloc.dart';
import 'package:em/presentation/expenses/pages/expenses_list/expense_list_viewmodel.dart';
import 'package:em/presentation/expenses/widgets/date_card.dart';
import 'package:em/presentation/expenses/widgets/expense_card.dart';
import 'package:em/presentation/expenses/widgets/expense_item.dart';
import 'package:em/resources/string_manager.dart';
import 'package:em/resources/style_manager.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../network/model/expense.dart';

class ExpenseListView extends StatefulWidget {
  const ExpenseListView({super.key});

  @override
  State<ExpenseListView> createState() => _ExpenseListViewState();
}

class _ExpenseListViewState extends State<ExpenseListView> {

  late ExpenseListViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ExpenseListViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: AppSize.s100,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
              child: CircleAvatar(
                maxRadius: AppSize.s24,
                child: Icon(FontAwesomeIcons.userNinja, size: AppSize.s20),
            )),
            Expanded(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi ${_viewModel.user.displayName!.split(" ")[0]} !", style: getheadline6Style(context),),
                  Text(AppStrings.welcomeText1.tr(), style: getBodyText2Style(context),)
                ],
              )),  
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p12),
            child: IconButton(
              splashRadius: AppSize.s20,
              onPressed: (){}, 
              icon: const Icon(Icons.notifications)),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: ()=>_viewModel.onAddOrRemoveClick(context, false),
            child: const Icon(FontAwesomeIcons.plus),
          ),
          const SizedBox(width: AppSize.s12,),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: ()=>_viewModel.onAddOrRemoveClick(context, true),
            child: const Icon(FontAwesomeIcons.minus),
          )
        ],
      ),
      body: ListView(
        children: [
          const DateCard(balance: "100",),
          const ExpenseCard(
            credit: "1000",
            debit: "500",
          ),
          BlocBuilder<ExpenseBloc, ExpenseState>(
            buildWhen: (_, state)=>state is Loading || state is ExpensesFetched,
            builder: (_, state){
              if(state is ExpensesFetched){
                return ExpenseListBuilder(
                  expenses: state.expenses, 
                  viewModel: _viewModel);
              }else if(state is Loading){
                return const CircularProgressIndicator();
              }else{
                return const SizedBox.shrink();
              }
            }
          )
        ],
      ),
    );
  }
}

class ExpenseListBuilder extends StatelessWidget {
  final ExpenseListViewModel viewModel;
  final List<Expense> expenses;
  const ExpenseListBuilder({
    super.key, 
    required this.expenses,
    required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: expenses.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p28),
      itemBuilder: (_, index){
        return ExpenseItem(
          expense: expenses[index],
          onDelete: ()=>viewModel.onDeleteItem(context, expenses[index].id),
          );
      });
  }
}