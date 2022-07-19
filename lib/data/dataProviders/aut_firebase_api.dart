import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthFirebaseApi {
  final auth.FirebaseAuth _firebaseAuth;
  AuthFirebaseApi({required auth.FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      rethrow;
    }
  }

  Future<auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      return user;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<auth.User?> getUser() => _firebaseAuth.userChanges();
}
