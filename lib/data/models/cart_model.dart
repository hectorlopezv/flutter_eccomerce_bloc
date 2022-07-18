// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(List<Product> products) {
    final sortedProducts = List.from(products)..sort((a, b) => a.name.compareTo(b.name));
    var quantity = {};
    for (var product in sortedProducts) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    }
    return quantity;
  }

  double get subtotal => products.fold(
      0, (previousValue, element) => previousValue + element.price);
  String get subtotalString => "${subtotal.toStringAsFixed(2)}";

  double deliveryFee(double subtotal) {
    if (subtotal > 30.0) {
      return 0.0;
    }
    return 10;
  }

  String freeDelivery(double subtotal) {
    if (subtotal > 30.0) {
      return "You Have Free Delivery";
    }
    final deliveryFee = 30.0 - subtotal;
    return "Add \$${deliveryFee.toStringAsFixed(2)} for FREE Delivery";
  }

  double total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }

  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [products];
}
