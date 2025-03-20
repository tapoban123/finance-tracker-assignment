// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_tracker/model/provider_models/base_provider_model.dart';
import 'package:finance_tracker/model/transaction_model.dart';

class TransactionsProviderModel extends BaseProviderModel {
  final List<TransactionModel>? incomeTransactions;
  final List<TransactionModel>? expenseTransactions;
  final double? totalIncome;
  final double? totalExpense;

  TransactionsProviderModel({
    required this.incomeTransactions,
    required this.expenseTransactions,
    required this.totalExpense,
    required this.totalIncome,
    required super.errorMessage,
    required super.isError,
    required super.isLoading,
  });

  TransactionsProviderModel copyWith({
    List<TransactionModel>? incomeTransactions,
    List<TransactionModel>? expenseTransactions,
    double? totalIncome,
    double? totalExpense,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
  }) {
    return TransactionsProviderModel(
      incomeTransactions: incomeTransactions ?? this.incomeTransactions,
      expenseTransactions: expenseTransactions ?? this.expenseTransactions,
      errorMessage: errorMessage ?? this.errorMessage,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpense: totalExpense ?? this.totalExpense,
    );
  }
}
