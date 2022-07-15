import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class Checkout extends Equatable {
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

  const Checkout({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.products,
  });
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
      ];

  Map<String, dynamic> toDocument() {
    Map customerAdress = Map();
    customerAdress['address'] = address;
    customerAdress['city'] = city;
    customerAdress['country'] = country;
    customerAdress['zipCode'] = zipCode;
    return {
      'customerAdress': customerAdress,
      "customerName": fullName,
      "CustomerEmail": email,
      'products': products?.map((product) => product.name).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
    };
  }
}
