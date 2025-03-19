import 'package:firebase_auth/firebase_auth.dart';

class AuthProviderModel {
  final bool isLoading;
  final bool isError;
  final User? user;
  final String? errorMessage;

  AuthProviderModel({
    required this.isError,
    required this.isLoading,
    required this.user,
    required this.errorMessage,
  });

  AuthProviderModel copyWith({
    bool? isLoading,
    bool? isError,
    User? user,
    String? errorMessage,
  }) {
    return AuthProviderModel(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
