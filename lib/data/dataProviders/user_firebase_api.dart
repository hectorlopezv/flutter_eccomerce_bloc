import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eccomerce_bloc/data/models/user_model.dart';

class UserFirebaseApi {
  final FirebaseFirestore firestore;

  UserFirebaseApi({required this.firestore});

  Stream<User> getUser(String userId) {
    return firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => User.fromSnapshot(snapshot));
  }

  Future<void> createUser(User user) async {
    return await firestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
  }

  Future<void> updateUser(User user) async {
    return await firestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => print("User Document Updated"));
  }
}
