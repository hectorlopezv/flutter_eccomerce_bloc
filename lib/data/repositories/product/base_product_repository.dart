
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getProducts();
}