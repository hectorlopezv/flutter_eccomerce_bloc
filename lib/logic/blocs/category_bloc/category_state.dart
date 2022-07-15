part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategorylistLoading extends CategoryState {}

class CategorylistLoaded extends CategoryState {
  final List<Category> categories;

  CategorylistLoaded({this.categories = const <Category>[]});

  @override
  List<Object> get props => [categories];
}

class CategorylistError extends CategoryState {}
