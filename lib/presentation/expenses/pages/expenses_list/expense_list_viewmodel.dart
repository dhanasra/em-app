import 'package:em/presentation/base/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpenseListViewModel extends BaseViewModel {

  ExpenseListViewModel._internal(){ start(); }
  static final _instance = ExpenseListViewModel._internal();
  factory ExpenseListViewModel() => _instance;

  late User user;

  @override
  void start() {
    user = FirebaseAuth.instance.currentUser!;
  }

  @override
  void dispose() {
    
  }

}