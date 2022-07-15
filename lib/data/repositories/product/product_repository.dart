import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eccomerce_bloc/data/dataProviders/product_api.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  late ProductsApi _productApi;
  final FirebaseFirestore _firestore;

  ProductRepository({ProductsApi? categoryApi})
      : _firestore = FirebaseFirestore.instance {
    _productApi = categoryApi ?? ProductsApi(firestore: _firestore);
  }

  @override
  Stream<List<Product>> getProducts() {
    return _productApi.getProducts();
  }
}
