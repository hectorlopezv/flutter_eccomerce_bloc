import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';

class CategoryApi {
  final FirebaseFirestore firestore;
  CategoryApi({required this.firestore});
  Stream<List<Category>> getCategories() {
    return firestore.collection("categories").snapshots().map(
        (snap) => snap.docs.map((doc) => Category.fromSnapshot(doc)).toList());
  }
}
