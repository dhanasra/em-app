import 'package:em/presentation/reports/bloc/reports_bloc.dart';
import 'package:em/presentation/reports/pages/reports_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {

  late ReportsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ReportsViewModel();    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: ColorManger.grey), splashRadius: AppSize.s18),
        title: Text('Report', style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(FontAwesomeIcons.calendarDays, color: ColorManger.grey), splashRadius: AppSize.s18)
        ],
      ),
      body: BlocListener<ReportsBloc, ReportsState>(
        listener: (_, state){

        },
        child: DefaultTabController(
          length: 3, 
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: ReportCharts(viewModel: _viewModel)),
          )
      ),
    );
  }
}

class ReportCharts extends StatelessWidget {
  final ReportsViewModel viewModel;
  const ReportCharts({
    super.key,
    required this.viewModel  
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24, horizontal: AppPadding.p4),
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
              Tab(text: 'This Week'),
              Tab(text: 'This Month'),
              Tab(text: 'This Year')
            ],
          )),
      ],
    );
  }
}