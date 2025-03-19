import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color backgroundColor;

  const AuthButton({
    super.key,
    required this.backgroundColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
