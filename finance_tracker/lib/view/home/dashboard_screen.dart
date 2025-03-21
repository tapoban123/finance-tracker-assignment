import 'package:finance_tracker/components/total_amount_container.dart';
import 'package:finance_tracker/view_model/auth_view_model/auth_nav_provider.dart';
import 'package:finance_tracker/view_model/auth_view_model/auth_view_model.dart';
import 'package:finance_tracker/view_model/transactions_view_model/transactions_view_model.dart';
import 'package:finance_tracker/view_model/user_view_model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  final String uid;
  const DashboardScreen(this.uid, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    ref.read(transactionsProvider.notifier).fetchTransactions(uid: widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
      transactionsProvider.select((value) => value.isLoading),
    );
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  "Total Balance",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${ref.watch(transactionsProvider).totalIncome! - ref.watch(transactionsProvider).totalExpense!}",

                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TotalAmountContainer(
                      amount: "${ref.watch(transactionsProvider).totalExpense}",
                      title: "Expenses",
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                    TotalAmountContainer(
                      amount: "${ref.watch(transactionsProvider).totalIncome}",
                      title: "Income",
                      backgroundColor: Colors.yellow[300]!,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
