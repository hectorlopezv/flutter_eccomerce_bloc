import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/wishlist_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends HydratedBloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoaded()) {
    on<LoadWishList>(_onLoadWishlist);
    on<AddProductToWishList>(_onAddProductToWishlist);
    on<RemoveProductFromWishList>(_onRemoveProductFromWishlist);
    on<UpdateState>(_onUpdateState);
  }
  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      emit(WishlistLoaded());
    } on Exception {
      emit(WishlistError());
    }
  }

  void _onUpdateState(event, Emitter<WishlistState> emit) {
    emit(
      WishlistLoaded(
        wishList: WishList(
          products: event.products,
        ),
      ),
    );
  }

  void _onAddProductToWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;

    if (state is WishlistLoaded) {
      final List<Product> prod = List.from(state.wishList.products)
        ..add(event.product);
      try {
        emit(
          WishlistLoaded(
            wishList: WishList(
              products: [...prod],
            ),
          ),
        );
        add(LoadWishList());
        add(UpdateState(prod));
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

  @override
  WishlistState? fromJson(Map<String, dynamic> json) {
    try {
      final productsDecoded = jsonDecode(json['wishList']);
      final List<Product> products = productsDecoded['products']
          .map<Product>(
            (product) => Product.fromMap(product),
          )
          .toList();
      if (products.length == 0) return null;
      return WishlistLoaded(
        wishList: WishList(
          products: products,
        ),
      );
    } catch (error) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WishlistState state) {
    final state = this.state;
    if (state is WishlistLoaded) {
      if(state.wishList.products.length == 0) return null;
      return {"wishList": state.wishList};
    }
  }
}
