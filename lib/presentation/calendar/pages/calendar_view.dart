import 'package:em/presentation/calendar/bloc/calendar_bloc.dart';
import 'package:em/presentation/calendar/pages/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../network/model/expense.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';
import '../../expenses/widgets/expense_item.dart';
import '../widgets/date_picker_view.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {

  late CalendarViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CalendarViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.check_box_outline_blank, color: ColorManger.grey), splashRadius: AppSize.s18),
        title: const Text(AppStrings.calendar),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_horiz, color: ColorManger.grey), splashRadius: AppSize.s18)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [

            SizedBox(
              height: 120,
              child: DatePickerView(
                onDateClicked: (clickedDate) => _viewModel.onDateClicked(context, clickedDate),
              ),
            ),

            BlocBuilder<CalendarBloc, CalendarState>(
              buildWhen: (_, state)=>state is ExpensesLoading || state is ExpensesLoaded,
              builder: (_, state){
                if(state is ExpensesLoaded){
                  return ExpenseListBuilder(
                    expenses: state.expenses, 
                    viewModel: _viewModel);
                }else if(state is ExpensesLoading){
                  return Container(
                    margin: const EdgeInsets.all(AppMargin.m24),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }else{
                  return const SizedBox.shrink();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}


class ExpenseListBuilder extends StatelessWidget {
  final CalendarViewModel viewModel;
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
          onDelete: (){},
        );
      });
  }
}
