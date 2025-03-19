import 'package:finance_tracker/view/components/auth_bottom_text.dart';
import 'package:finance_tracker/view/components/auth_button.dart';
import 'package:finance_tracker/view/components/auth_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100),
            AuthTextField(
              textController: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            AuthTextField(
              textController: _passwordController,
              hintText: "Password",
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            SizedBox(height: 50),
            AuthButton(
              backgroundColor: Colors.blueAccent,
              buttonText: "Login",
              onTap: () {},
            ),
            SizedBox(height: 8),
            AuthBottomText(
              question: "Don't have an account? ",
              solution: "Sign Up now!",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
