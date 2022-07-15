part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductList extends ProductEvent {}

class UpdateProductList extends ProductEvent {
  final List<Product> products;
  @override
  List<Object> get props => [products];

  UpdateProductList(this.products);
}
