import 'package:finance_tracker/firebase_options.dart';
import 'package:finance_tracker/view/auth/login_screen.dart';
import 'package:finance_tracker/view/home/home_screen.dart';
import 'package:finance_tracker/view_model/auth_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authProvider.notifier).authStateChanges;

    return StreamBuilder(
      stream: userState,
      builder: (context, snapshot) {
        return MaterialApp(
          title: "Finance Tracker",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          home: snapshot.data == null ? const LoginScreen() : HomeScreen(),
        );

        // return Scaffold(body: Center(child: Text("Error")));
      },
    );
  }
}
