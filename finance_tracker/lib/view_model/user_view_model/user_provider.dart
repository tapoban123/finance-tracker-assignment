import 'package:finance_tracker/model/provider_models/user_provider_model.dart';
import 'package:finance_tracker/model/user_model.dart';
import 'package:finance_tracker/services/firebase_storage_service/manage_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

StateNotifierProvider<UserProvider, UserProviderModel> userProvider =
    StateNotifierProvider(
      (ref) => UserProvider(usersService: ManageUsersService()),
    );

class UserProvider extends StateNotifier<UserProviderModel> {
  final ManageUsersService _manageUsersService;

  UserProvider({required ManageUsersService usersService})
    : _manageUsersService = usersService,
      super(
        UserProviderModel(
          isLoading: false,
          isError: false,
          errorMessage: null,
          uid: null,
          name: null,
          email: null,
        ),
      );

  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
  }) async {
    state = state.copyWith(isLoading: true);
    final userModel = UserModel(uid: uid, name: name, email: email);
    _manageUsersService
        .createNewUser(user: userModel)
        .then((value) {
          state = state.copyWith(
            isLoading: false,
            email: email,
            uid: uid,
            name: name,
          );
        })
        .onError((error, stackTrace) {
          state = state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: error.toString(),
          );
        });
  }

  Future<void> deleteUser({required String uid}) async {
    _manageUsersService.deleteUser(uid: uid);
  }
}
