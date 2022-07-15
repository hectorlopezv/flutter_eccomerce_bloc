part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoryList extends CategoryEvent {}

class UpdateCategoryList extends CategoryEvent {
  final List<Category> categories;
  @override
  List<Object> get props => [categories];

  UpdateCategoryList(this.categories);
}
