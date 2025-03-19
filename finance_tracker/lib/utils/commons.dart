import 'package:flutter/material.dart';

Route pageRouteAnimation(
  BuildContext context, {
  required Widget screen,
  double? x,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offset = Tween(begin: Offset(x ?? 1, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastEaseInToSlowEaseOut,
        ),
      );

      return SlideTransition(position: offset, child: child);
    },
  );
}

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => CircularProgressIndicator(),
  );
}
