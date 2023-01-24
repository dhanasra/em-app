import 'package:equatable/equatable.dart';

class Expense extends Equatable{

  final int id;
  final int dateTime;
  final bool isIncome;
  final double amount;
  final String? remark;
  final String category;
  final String? paymentMode;

  const Expense({
    required this.id,
    required this.dateTime,
    required this.isIncome,
    required this.amount,
    this.remark,
    this.paymentMode,
    required this.category
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      dateTime: json['dateTime'],
      isIncome: json['isIncome'],
      amount: json['amount'],
      remark: json['remark'],
      category: json['category'],
      paymentMode: json['paymentMode']
    );
  }


  @override
  List<Object?> get props => [];

}