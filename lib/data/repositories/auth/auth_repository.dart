import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_eccomerce_bloc/data/dataProviders/aut_firebase_api.dart';
import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/auth/base_auth_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/user/user_repository.dart';

class AuthRepository implements AuthBaseRepository {
  final AuthFirebaseApi authFirebaseApi;
  final UserRepository _userRepository;

  AuthRepository(
      {required this.authFirebaseApi, required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<auth.User?> signUp(
      {required User user_1, required String password}) async {
    try {
      final user =
          await authFirebaseApi.signUp(user_1: user_1, password: password);
      _userRepository.createUser(
        user_1.copyWith(id: user!.uid),
      );
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
