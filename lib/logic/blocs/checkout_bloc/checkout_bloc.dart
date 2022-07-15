import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/cart_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/checkout_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/checkout/checkout_repository.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckOutRepository _checkOutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc(
      {required CheckOutRepository checkoutRepository,
      required CartBloc cartBloc})
      : _checkOutRepository = checkoutRepository,
        _cartBloc = cartBloc,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutOrderLoaded(
                  products: (cartBloc.state as CartLoaded).cart.products,
                  subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                  deliveryFee:
                      (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                  total: (cartBloc.state as CartLoaded).cart.totalString,
                )
              : CheckoutOrderLoading(),
        ) {
    on<LoadCheckoutOrder>(_onLoadCheckoutOrder);
    on<ConfirmCheckoutOrder>(_onConfirmCheckoutOrder);
    on<UpdateCheckoutOrder>(_onUpdateCheckoutOrder);

    //Update Checkout on Cart Change
    _cartSubscription = _cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckoutOrder(cart: state.cart));
      }
    });
  }
  Future<void> _onLoadCheckoutOrder(
      LoadCheckoutOrder event, Emitter<CheckoutState> emit) async {
    emit(CheckoutOrderLoading());
    try {} catch (error) {
      print(error);
      emit(CheckoutOrderError());
    }
  }

  Future<void> _onConfirmCheckoutOrder(
      ConfirmCheckoutOrder event, Emitter<CheckoutState> emit) async {
   
    final state = this.state;
    try {
      if (state is CheckoutOrderLoaded) {
         await _checkOutRepository.addCheckout(event.checkout);
        emit(CheckoutOrderLoading());



      }
    } catch (error) {
      print(error);
      emit(CheckoutOrderError());
    }
  }

  Future<void> _onUpdateCheckoutOrder(
      UpdateCheckoutOrder event, Emitter<CheckoutState> emit) async {
    
    final state = this.state;
    try {
      if (state is CheckoutOrderLoaded) {
        emit(
          CheckoutOrderLoaded(
            fullName: event.fullName ?? state.fullName,
            email: event.email ?? state.email,
            products: event.cart?.products ?? state.products,
            subtotal: event.cart?.subtotalString ?? state.subtotal,
            deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
            total: event.cart?.totalString ?? state.total,
            address: event.address ?? state.address,
            city: event.city ?? state.city,
            country: event.country ?? state.country,
            zipCode: event.zipCode ?? state.zipCode,
          ),
        );
      }
    } catch (error) {
      print(error);
      emit(CheckoutOrderError());
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    _checkoutSubscription?.cancel();
    return super.close();
  }
}
