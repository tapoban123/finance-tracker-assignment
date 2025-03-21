import 'package:finance_tracker/services/auth/firebase_auth_service.dart';
import 'package:finance_tracker/utils/commons.dart';
import 'package:finance_tracker/utils/utils.dart';
import 'package:finance_tracker/view/auth/login_screen.dart';
import 'package:finance_tracker/components/auth_bottom_text.dart';
import 'package:finance_tracker/components/auth_button.dart';
import 'package:finance_tracker/components/auth_text_field.dart';
import 'package:finance_tracker/view_model/auth_view_model/auth_nav_provider.dart';
import 'package:finance_tracker/view_model/auth_view_model/auth_view_model.dart';
import 'package:finance_tracker/view_model/user_view_model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProviderObj = ref.watch(authProvider);

    return authProviderObj.isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
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
                onTap: () {
                  ref
                      .read(authProvider.notifier)
                      .signUpUser(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      )
                      .then((value) {
                        ref
                            .read(userProvider.notifier)
                            .createUser(
                              uid: ref.read(authProvider).user!.uid,
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                            );
                        if (authProviderObj.isLoading && context.mounted) {
                          // showProgressDialog(context);
                          printInDebug("Loading Auth");
                        } else if (authProviderObj.isError && context.mounted) {
                          showSnackBar(
                            context,
                            message: authProviderObj.errorMessage!,
                          );
                          printInDebug(authProviderObj.errorMessage!);
                        }
                      });
                },
              ),
              SizedBox(height: 8),
              AuthBottomText(
                onTap: () {
                  ref.read(authNavProvider.notifier).update((state) => 0);
                },
                question: "Already have an account? ",
                solution: "Login Now",
              ),
            ],
          ),
        );
  }
}
