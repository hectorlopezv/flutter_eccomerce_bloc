part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductlistLoading extends ProductState {}

class ProductlistLoaded extends ProductState {
  final List<Product> products;

  ProductlistLoaded({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}

class ProductlistError extends ProductState {}
