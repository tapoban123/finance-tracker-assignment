import 'package:finance_tracker/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        printInDebug("Account already exists.");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        printInDebug("User does not exists.");
      } else if (e.code == "wrong-password") {
        printInDebug("Wrong Password.");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOutUser() async {
    await firebaseAuth.signOut();
  }
}
