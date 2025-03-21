import 'package:finance_tracker/model/provider_models/auth_provider_model.dart';
import 'package:finance_tracker/services/auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<AuthViewModel, AuthProviderModel> authProvider =
    StateNotifierProvider(
      (ref) => AuthViewModel(firebaseAuthService: FirebaseAuthService()),
    );

class AuthViewModel extends StateNotifier<AuthProviderModel> {
  final FirebaseAuthService _firebaseAuthService;

  AuthViewModel({required FirebaseAuthService firebaseAuthService})
    : _firebaseAuthService = firebaseAuthService,
      super(
        AuthProviderModel(
          isError: false,
          isLoading: false,
          user: null,
          errorMessage: null,
        ),
      );

  Stream<User?> get authStateChanges => _firebaseAuthService.authState;

  Future<void> updateCurrentUser(User user) async {
    state = state.copyWith(user: user);
  }

  Future<void> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      final user = await _firebaseAuthService.signUpUser(
        email: email,
        password: password,
      );
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loginUser({required String email, required String password}) async {
    try {
      state = state.copyWith(isLoading: true);
      final user = await _firebaseAuthService.loginUser(
        email: email,
        password: password,
      );
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> signOutUser() async {
    _firebaseAuthService.signOutUser();
  }
}
