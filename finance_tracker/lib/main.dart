import 'package:finance_tracker/view/auth/login_screen.dart';
import 'package:finance_tracker/view/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Finance Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const SignUpScreen(),
    );
  }
}