import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<HomeNavProvider, int> homeNavProvider =
    StateNotifierProvider((ref) => HomeNavProvider());

class HomeNavProvider extends StateNotifier<int> {
  HomeNavProvider() : super(0);

  void changeScreen(int screenNumber) {
    state = screenNumber;
  }
}
