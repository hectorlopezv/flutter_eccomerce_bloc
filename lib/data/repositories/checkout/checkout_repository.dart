import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eccomerce_bloc/data/dataProviders/checkout_api.dart';
import 'package:flutter_eccomerce_bloc/data/models/checkout_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/checkout/base_checkout_repository.dart';

class CheckOutRepository extends BaseCheckOutRepository {
  late CheckOutApi _checkOutApi;
  final FirebaseFirestore _firestore;

  CheckOutRepository({CheckOutApi? checkOutApi})
      : _firestore = FirebaseFirestore.instance {
    _checkOutApi = checkOutApi ?? CheckOutApi(firestore: _firestore);
  }

  @override
  Future<void> addCheckout(Checkout checkout) async {
      return await _checkOutApi.addCheckout(checkout);
  }
}
