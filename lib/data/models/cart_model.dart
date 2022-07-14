// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class Cart extends Equatable {
  Cart();

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
    return "Add \$${30.0 - subtotal} for FREE Delivery";
  }

  double total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }

  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  List<Product> products = [
    Product(
      name: "Soft Drink #1",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Soft Drink #2",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      name: "Soft Drink #3",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      name: "Soft Drink #4",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    )
  ];

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [subtotal];
}
