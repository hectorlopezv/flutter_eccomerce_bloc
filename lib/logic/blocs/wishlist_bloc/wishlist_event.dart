part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class LoadWishList extends WishlistEvent {}

class AddProductToWishList extends WishlistEvent {
  final Product product;
  @override
  List<Object> get props => [product];

  const AddProductToWishList(this.product);
}

class RemoveProductFromWishList extends WishlistEvent {
  final Product product;
  @override
  List<Object> get props => [product];

  const RemoveProductFromWishList(this.product);
}


class UpdateState extends WishlistEvent {
  final List<Product> products;
  @override
  List<Object> get props => [products];

  const UpdateState(this.products);
}