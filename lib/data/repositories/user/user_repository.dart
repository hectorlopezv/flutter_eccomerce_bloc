import 'package:flutter_eccomerce_bloc/data/dataProviders/user_firebase_api.dart';
import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/user/base_user_repository.dart';

class UserRepository implements UserBaseRepository {
  final UserFirebaseApi userFirebaseApi;

  UserRepository({required this.userFirebaseApi});
  @override
  Future<void> createUser(User user) async {
    await userFirebaseApi.createUser(user);
  }

  @override
  Stream<User> getUser(String userId) => userFirebaseApi.getUser(userId);

  @override
  Future<void> updateUser(User user) async {
    await userFirebaseApi.updateUser(user);
  }
}
