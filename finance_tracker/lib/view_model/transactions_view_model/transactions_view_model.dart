import 'package:finance_tracker/model/provider_models/transactions_provider_model.dart';
import 'package:finance_tracker/model/transaction_model.dart';
import 'package:finance_tracker/services/firebase_storage_service/enums.dart';
import 'package:finance_tracker/services/firebase_storage_service/manage_transactions_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<TransactionsViewModel, TransactionsProviderModel>
transactionsProvider = StateNotifierProvider(
  (ref) =>
      TransactionsViewModel(transactionsService: ManageTransactionsService()),
);

class TransactionsViewModel extends StateNotifier<TransactionsProviderModel> {
  final ManageTransactionsService _transactionsService;

  TransactionsViewModel({
    required ManageTransactionsService transactionsService,
  }) : _transactionsService = transactionsService,
       super(
         TransactionsProviderModel(
           incomeTransactions: null,
           expenseTransactions: null,
           totalExpense: null,
           totalIncome: null,
           errorMessage: null,
           isError: false,
           isLoading: true,
         ),
       );

  Future<void> createNewTransaction({
    required TransactionModel newtransaction,
  }) async {
    state = state.copyWith(isLoading: true);
    _transactionsService
        .createTransaction(transaction: newtransaction)
        .onError((error, stackTrace) {
          state = state.copyWith(
            isError: true,
            errorMessage: error.toString(),
            isLoading: false,
          );
        })
        .then((_) {
          state = state.copyWith(isLoading: false);
        });
  }

  Future<void> editTransaction({required TransactionModel transaction}) async {
    state = state.copyWith(isLoading: true);
    _transactionsService
        .editTransaction(updatedTransaction: transaction)
        .onError((error, stackTrace) {
          state = state.copyWith(
            isError: true,
            errorMessage: error.toString(),
            isLoading: false,
          );
        })
        .then((_) {
          state = state.copyWith(isLoading: false);
        });
  }

  Future<void> deleteTransaction({required String transactionId}) async {
    state = state.copyWith(isLoading: true);
    _transactionsService
        .deleteTransaction(transactionId: transactionId)
        .onError((error, stackTrace) {
          state = state.copyWith(
            isError: true,
            errorMessage: error.toString(),
            isLoading: false,
          );
        })
        .then((_) {
          state = state.copyWith(isLoading: false);
        });
  }

  Future<void> fetchTransactions({required String uid}) async {
    double totalIncome;
    double totalExpense;

    if (!state.isLoading) {
      state = state.copyWith(isLoading: true);
    }

    _transactionsService
        .getAllTransactions(uid: uid)
        .then((transactions) {
          final List<TransactionModel> allTransactions =
              transactions.map((e) => TransactionModel.fromMap(e)).toList();
          final List<TransactionModel> incomeTransactions =
              allTransactions
                  .where(
                    (element) =>
                        element.transactionType == TransactionType.income.type,
                  )
                  .toList();
          final List<TransactionModel> expenseTransactions =
              allTransactions
                  .where(
                    (element) =>
                        element.transactionType == TransactionType.expense.type,
                  )
                  .toList();

          totalIncome = calculateTotalIncome(incomeTransactions);
          totalExpense = calculateTotalExpense(incomeTransactions);

          state = state.copyWith(
            isLoading: false,
            expenseTransactions: expenseTransactions,
            incomeTransactions: incomeTransactions,
            totalExpense: totalExpense,
            totalIncome: totalIncome,
          );
        })
        .onError((error, stackTrace) {
          state = state.copyWith(
            isError: true,
            errorMessage: error.toString(),
            isLoading: false,
          );
        });
  }

  double calculateTotalIncome(List<TransactionModel> incomeTransactions) {
    double totalIncome = 0;
    for (final item in incomeTransactions) {
      totalIncome += item.amount;
    }

    return totalIncome;
  }

  double calculateTotalExpense(List<TransactionModel> expenseTransactions) {
    double totalExpense = 0;
    for (final item in expenseTransactions) {
      totalExpense += item.amount;
    }

    return totalExpense;
  }
}
