import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getCategories();
}
