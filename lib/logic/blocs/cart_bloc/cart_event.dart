part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddProductToCartList extends CartEvent {
  final Product product;
  @override
  List<Object> get props => [product];

  AddProductToCartList(this.product);
}

class RemoveProductFromCartList extends CartEvent {
  final Product product;
  @override
  List<Object> get props => [product];

  RemoveProductFromCartList(this.product);
}
