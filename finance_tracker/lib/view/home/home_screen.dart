import 'package:finance_tracker/view_model/auth_view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Screen"),
          ElevatedButton(
            onPressed: () {
              ref.read(authProvider.notifier).signOutUser();
            },
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
