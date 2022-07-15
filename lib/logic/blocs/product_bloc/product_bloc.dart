import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductlistLoading()) {
    on<LoadProductList>(_onLoadCategoryList);
    on<UpdateProductList>(_onUpdateProductlist);
  }

  Future<void> _onLoadCategoryList(event, Emitter<ProductState> emit) async {
    emit(ProductlistLoading());
    try {
      _productSubscription?.cancel();
      _productSubscription = _productRepository.getProducts().listen(
            (categories) => add(UpdateProductList(categories)),
          );
    } catch (error) {
      print(error);
      emit(ProductlistError());
    }
  }

  Future<void> _onUpdateProductlist(
      UpdateProductList event, Emitter<ProductState> emit) async {
    emit(ProductlistLoading());
    try {
      emit(ProductlistLoaded(products: event.products));
    } on Exception {
      emit(ProductlistError());
    }
  }

  @override
  Future<void> close() {
    _productSubscription?.cancel();
    return super.close();
  }
}
