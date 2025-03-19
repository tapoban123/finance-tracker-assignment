import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';

class AuthBottomText extends StatelessWidget {
  final String question;
  final String solution;
  final VoidCallback onTap;

  const AuthBottomText({
    super.key,
    required this.onTap,
    required this.question,
    required this.solution,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: question,
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: solution,
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
