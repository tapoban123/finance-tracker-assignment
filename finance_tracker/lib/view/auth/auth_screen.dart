import 'package:finance_tracker/view/auth/login_screen.dart';
import 'package:finance_tracker/view/auth/sign_up_screen.dart';
import 'package:finance_tracker/view_model/auth_view_model/auth_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(authNavProvider),
        children: [LoginScreen(), SignUpScreen()],
      ),
    );
  }
}
