import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/cart_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProductToCartList>(_onAddProductToCartList);
    on<RemoveProductFromCartList>(_onRemoveProductFromCartList);
  }

  void _onLoadCart(event, Emitter<CartState> emit) async {
    try {
      emit(CartLoaded());
    } on Exception {
      emit(CartError());
    }
  }

  void _onAddProductToCartList(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (error) {}
    }
  }

  void _onRemoveProductFromCartList(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (error) {}
    }
  }
}
