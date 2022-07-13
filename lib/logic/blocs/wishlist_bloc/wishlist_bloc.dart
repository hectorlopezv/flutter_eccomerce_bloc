import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishList>(_onLoadWishlist);
    on<AddProductToWishList>(_onAddProductToWishlist);
    on<RemoveProductFromWishList>(_onRemoveProductFromWishlist);
  }
  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
 
    try {
      emit(WishlistLoaded());
    } on Exception {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;

    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishList: WishList(
              products: List.from(state.wishList.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          WishlistError(),
        );
      }
    }
  }

  void _onRemoveProductFromWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;

    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishList: WishList(
              products: List.from(state.wishList.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          WishlistError(),
        );
      }
    }
  }
}
