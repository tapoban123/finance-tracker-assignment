import 'package:finance_tracker/utils/commons.dart';
import 'package:finance_tracker/utils/utils.dart';
import 'package:finance_tracker/view/auth/sign_up_screen.dart';
import 'package:finance_tracker/view/components/auth_bottom_text.dart';
import 'package:finance_tracker/view/components/auth_button.dart';
import 'package:finance_tracker/view/components/auth_text_field.dart';
import 'package:finance_tracker/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProviderObj = ref.watch(authProvider);

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
              onTap: () {
                ref
                    .read(authProvider.notifier)
                    .loginUser(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                if (authProviderObj.isLoading) {
                  showProgressDialog(context);
                  printInDebug("Loading Auth");
                } else if (authProviderObj.isError) {
                  showSnackBar(context, message: authProviderObj.errorMessage!);
                  printInDebug(authProviderObj.errorMessage!);
                }
              },
            ),
            SizedBox(height: 8),
            AuthBottomText(
              question: "Don't have an account? ",
              solution: "Sign Up now!",
              onTap: () {
                Navigator.of(context).pushReplacement(
                  pageRouteAnimation(context, screen: SignUpScreen(), x: 1),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
