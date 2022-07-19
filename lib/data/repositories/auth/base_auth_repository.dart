import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';

abstract class AuthBaseRepository {
  Stream<auth.User?> get user;
  Future<auth.User?> signUp({required User user_1, required String password});
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
}
