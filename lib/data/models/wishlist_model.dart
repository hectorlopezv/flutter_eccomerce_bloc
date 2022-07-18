// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class WishList extends Equatable {
  final List<Product> products;

  const WishList({
    this.products = const <Product>[],
  });

  @override
  List<Object> get props => [products];

   WishList copyWith({
    List<Product>? products,
  }) {
    return WishList(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory WishList.fromMap(Map<String, dynamic> map) {
    return WishList(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WishList.fromJson(String source) =>
      WishList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
