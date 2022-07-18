import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class ProductImage extends StatelessWidget {
  final double height;
  final double adjustedWidth;
  const ProductImage({
    Key? key,
    required this.widthFactor,
    required this.product,
    required this.height,
    required this.adjustedWidth,
  }) : super(key: key);

  final double widthFactor;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjustedWidth,
      height: height,
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}