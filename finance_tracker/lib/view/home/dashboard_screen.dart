import 'package:finance_tracker/components/total_amount_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text("Total Balance"),
            Text("₹24,124"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TotalAmountContainer(
                  amount: "2,225",
                  title: "Expenses",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                ),
                TotalAmountContainer(
                  amount: "2,225",
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
