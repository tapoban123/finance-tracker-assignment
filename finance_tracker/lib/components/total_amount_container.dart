import 'package:flutter/material.dart';

class TotalAmountContainer extends StatelessWidget {
  final String amount;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  const TotalAmountContainer({
    super.key,
    required this.title,
    required this.amount,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: backgroundColor,
      borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "₹$amount",
            style: TextStyle(
              color: textColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(title, style: TextStyle(color: textColor, fontSize: 14)),
        ],
      ),
    );
  }
}
