import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_eccomerce_bloc/data/dataProviders/aut_firebase_api.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/auth/base_auth_repository.dart';

class AuthRepository implements AuthBaseRepository {
  final AuthFirebaseApi authFirebaseApi;

  AuthRepository({required this.authFirebaseApi});

  @override
  Future<auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      final user =
          await authFirebaseApi.signUp(email: email, password: password);
      return user;
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> signOut() async {
    await authFirebaseApi.signOut();
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await authFirebaseApi.signIn(email: email, password: password);
    } catch (error) {
      print(error);
    }
  }

  @override
  Stream<auth.User?> get user => authFirebaseApi.getUser();
}
