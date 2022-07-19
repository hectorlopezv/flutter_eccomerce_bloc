import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';

abstract class UserBaseRepository{
  Stream<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}