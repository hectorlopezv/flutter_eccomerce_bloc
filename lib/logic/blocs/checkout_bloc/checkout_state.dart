part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutOrderLoading extends CheckoutState {}

class CheckoutOrderLoaded extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;
  final Checkout checkout;
  final PaymentMethod paymentMethod;

  CheckoutOrderLoaded(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.subtotal,
      this.deliveryFee,
      this.total,
      this.products,
      this.paymentMethod = PaymentMethod.google_pay})
      : checkout = Checkout(
          fullName: fullName,
          email: email,
          address: address,
          city: city,
          country: country,
          zipCode: zipCode,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
          products: products,
        );

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        subtotal,
        deliveryFee,
        total,
        products,
        paymentMethod
      ];
}

class CheckoutOrderError extends CheckoutState {}
