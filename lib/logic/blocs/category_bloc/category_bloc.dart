import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategorylistLoading()) {
    on<LoadCategoryList>(_onLoadCategorylist);
    on<UpdateCategoryList>(_onUpdateCategorylist);
  }

  Future<void> _onLoadCategorylist(event, Emitter<CategoryState> emit) async {
    emit(CategorylistLoading());
    try {
      _categorySubscription?.cancel();
      _categorySubscription = _categoryRepository.getCategories().listen(
            (categories) => add(UpdateCategoryList(categories)),
          );
    } on Exception {
      emit(CategorylistError());
    }
  }

  void _onUpdateCategorylist(
      UpdateCategoryList event, Emitter<CategoryState> emit) async {
    emit(CategorylistLoading());
    try {
      emit(CategorylistLoaded(categories: event.categories));
    } on Exception {
      emit(CategorylistError());
    }
  }

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }
}
