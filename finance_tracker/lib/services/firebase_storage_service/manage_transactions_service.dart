import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_tracker/model/transaction_model.dart';

class ManageTransactionsService {
  final db = FirebaseFirestore.instance.collection(
    "finance_users_transactions",
  );

  Future<void> createTransaction({
    required TransactionModel transaction,
  }) async {
    final transactionMap = transaction.toMap();

    await db.doc(transaction.transactionId).set(transactionMap);
  }

  Future<void> editTransaction({
    required TransactionModel updatedTransaction,
  }) async {
    final transactionMap = updatedTransaction.toMap();
    await db.doc(updatedTransaction.transactionId).update(transactionMap);
  }

  Future<void> deleteTransaction({required String transactionId}) async {
    await db.doc(transactionId).delete();
  }

  Future<List<Map<String, dynamic>>> getAllTransactions({
    required String uid,
  }) async {
    List<Map<String, dynamic>> transactionsList = [];

    await db.where("uid", isEqualTo: uid).get().then((snapshot) {
      for (final doc in snapshot.docs) {
        transactionsList.add(doc.data());
      }
    });

    return transactionsList;
  }
}
