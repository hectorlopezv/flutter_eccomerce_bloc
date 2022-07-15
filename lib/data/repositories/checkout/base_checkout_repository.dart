import 'package:flutter_eccomerce_bloc/data/models/checkout_model.dart';

abstract class BaseCheckOutRepository {
  Future<void> addCheckout(Checkout checkout);
}
