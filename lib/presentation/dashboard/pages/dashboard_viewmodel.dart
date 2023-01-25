import 'package:em/presentation/base/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DashboardViewModel extends BaseViewModel {
  
  DashboardViewModel._internal();
  static final _instance = DashboardViewModel._internal();
  factory DashboardViewModel() => _instance;

  final User user = FirebaseAuth.instance.currentUser!;
  final Box wallet = Hive.box('wallet');

  late String income;
  late String expense;
  late String balance;

  @override
  void start() {
    
    income = wallet.get('income').toString();
    expense = wallet.get('expense').toString();
    balance = wallet.get('balance').toString();
  }

  @override
  void dispose() {
    
  }

}