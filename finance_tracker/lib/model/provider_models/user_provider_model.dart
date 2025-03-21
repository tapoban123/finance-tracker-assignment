// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_tracker/model/provider_models/base_provider_model.dart';

class UserProviderModel extends BaseProviderModel {
  final String? uid;
  final String? name;
  final String? email;

  UserProviderModel({
    required super.isLoading,
    required super.isError,
    required super.errorMessage,
    required this.uid,
    required this.name,
    required this.email,
  });

  UserProviderModel copyWith({
    String? uid,
    String? name,
    String? email,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
  }) {
    return UserProviderModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
