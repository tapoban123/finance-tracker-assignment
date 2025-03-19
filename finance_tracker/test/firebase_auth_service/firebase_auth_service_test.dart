import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
  });

  const String email = "hello@gmail.com";
  const String password = "hello123";

  test(
    "should create an account for the user with email and password.",
    () async {
      // ARRANGE
      final credential = await mockFirebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user!;

      expect(user.email, email);
    },
  );

  test("should login to an existing account.", () async {
    mockFirebaseAuth = MockFirebaseAuth(mockUser: MockUser(email: email));
    // ARRANGE
    final credential = await mockFirebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;

    expect(user.email, email);
  });
}
