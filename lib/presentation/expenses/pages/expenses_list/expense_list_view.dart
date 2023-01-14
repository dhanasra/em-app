import 'package:easy_localization/easy_localization.dart';
import 'package:em/presentation/expenses/pages/expenses_list/expense_list_viewmodel.dart';
import 'package:em/presentation/expenses/widgets/date_card.dart';
import 'package:em/presentation/expenses/widgets/expense_card.dart';
import 'package:em/resources/string_manager.dart';
import 'package:em/resources/style_manager.dart';
import 'package:em/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(FontAwesomeIcons.plus),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        children: const [
          DateCard(balance: "100",),
          ExpenseCard(
            credit: "1000",
            debit: "500",
          )
        ],
      ),
    );
  }
}

