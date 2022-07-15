import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eccomerce_bloc/data/dataProviders/category_api.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  late CategoryApi _categoryApi;
  final FirebaseFirestore _firestore;

  CategoryRepository({CategoryApi? categoryApi})
      : _firestore = FirebaseFirestore.instance {
    _categoryApi = categoryApi ?? CategoryApi(firestore: _firestore);
  }

  @override
  Stream<List<Category>> getCategories() {
    return _categoryApi.getCategories();
  }
}
