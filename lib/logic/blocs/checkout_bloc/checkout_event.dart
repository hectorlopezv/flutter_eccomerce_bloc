part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class LoadCheckoutOrder extends CheckoutEvent {}

class ConfirmCheckoutOrder extends CheckoutEvent {
  final Checkout checkout;

  ConfirmCheckoutOrder({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}

class UpdateCheckoutOrder extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;
  final PaymentMethod? paymentMethod;

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        cart,
        paymentMethod,
      ];

  UpdateCheckoutOrder({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.cart,
    this.paymentMethod
  });
}
