part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  WishlistState();
  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  final WishList wishList;
  @override
  List<Object> get props => [wishList];

  WishlistLoaded({this.wishList = const WishList()});
}

class WishlistError extends WishlistState {
  @override
  List<Object> get props => [];
}
