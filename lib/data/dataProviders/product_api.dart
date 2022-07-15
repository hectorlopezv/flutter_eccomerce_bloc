import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class ProductsApi {
  final FirebaseFirestore firestore;
  ProductsApi({required this.firestore});
  @override
  Stream<List<Product>> getProducts() {
    return firestore
        .collection("products")
        .snapshots()
        .map((snap) => snap.docs.map((doc) {
          print("doc ${doc.data()}");
             return  Product.fromSnapshot(doc);
            }).toList());
  }
}
