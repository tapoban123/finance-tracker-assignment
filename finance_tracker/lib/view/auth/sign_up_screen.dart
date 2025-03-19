import 'package:finance_tracker/view/components/auth_bottom_text.dart';
import 'package:finance_tracker/view/components/auth_button.dart';
import 'package:finance_tracker/view/components/auth_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
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
              "Sign Up",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            AuthTextField(
              textController: _nameController,
              hintText: "Name",
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 20),
            AuthButton(
              backgroundColor: Colors.purple,
              buttonText: "Sign Up",
              onTap: () {},
            ),
            SizedBox(height: 8),
            AuthBottomText(
              onTap: () {},
              question: "Already have an account? ",
              solution: "Login Now",
            ),
          ],
        ),
      ),
    );
  }
}
