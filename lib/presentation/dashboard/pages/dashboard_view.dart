import 'package:em/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:em/presentation/dashboard/pages/dashboard_viewmodel.dart';
import 'package:em/presentation/dashboard/widgets/dashboard_header.dart';
import 'package:em/presentation/dashboard/widgets/transact_item.dart';
import 'package:em/presentation/dashboard/widgets/transact_overview.dart';
import 'package:em/presentation/dashboard/widgets/wallet_card.dart';
import 'package:em/resources/color_manager.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  late DashboardViewModel _viewModel;

  @override
  void initState() {
    
    _viewModel = DashboardViewModel();
    _viewModel.start();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              DashboardHeader( 
                user: _viewModel.user,
              ),
              
              WalletCard(
                balance: _viewModel.balance
              ),
              
              TransactOverview(
                income: _viewModel.income,
                outcome: _viewModel.expense
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: AppMargin.m18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transactions', style: Theme.of(context).textTheme.headline6),
                    TextButton(
                      onPressed: (){}, 
                      child: Text('See All', style: Theme.of(context).textTheme.subtitle2!.copyWith(color: ColorManger.primary))
                    )
                  ],
                )), 
              
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p2),
                child: Text('Today', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: ColorManger.grey))),

              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (_, state){
                  if(state is TodayExpensesLoaded){
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.expenses.length,
                      itemBuilder: (_, index){
                        return TransactItem(expense: state.expenses[index]);
                      });
                  }
                  return const SizedBox.shrink();
                })
            ],
          ),
        ),
      )
    );
  }
}