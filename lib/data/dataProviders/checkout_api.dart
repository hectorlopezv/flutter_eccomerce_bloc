import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eccomerce_bloc/data/models/checkout_model.dart';

class CheckOutApi {
  final FirebaseFirestore firestore;
  CheckOutApi({required this.firestore});

  @override
  Future<void> addCheckout(Checkout checkout) {
    return firestore.collection('checkout').add(checkout.toDocument());
  }
}
