import 'package:finance_tracker/model/provider_models/base_provider_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProviderModel extends BaseProviderModel {
  final User? user;

  AuthProviderModel({
    required this.user,
    required super.isError,
    required super.isLoading,
    required super.errorMessage,
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
