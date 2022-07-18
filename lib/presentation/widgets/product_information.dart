import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class ProductInformation extends StatelessWidget {
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;
  const ProductInformation({
    Key? key,
    required this.product,
    this.quantity,
    required this.fontColor,
    this.isOrderSummary = false,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        ),
        Text(
          "\$${product.price}",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}


