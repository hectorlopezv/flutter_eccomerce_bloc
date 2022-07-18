import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_actions.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_background.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_image.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_information.dart';

class ProductCard extends StatelessWidget {
  final double leftPosition;
  final Product product;
  final double widthFactor;
  final double height;
  final bool isCart;
  final bool isWishList;
  final bool isCatalog;
  final bool isSummary;
  final int? quantity;
  final Color iconColor;
  final Color fontColor;

  const ProductCard.catalog({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishList = false,
    this.height = 150,
    this.isCart = false,
    this.isCatalog = true,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  });

  const ProductCard.cart({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.leftPosition = 5,
    this.isWishList = false,
    this.height = 150,
    this.isCart = false,
    this.isCatalog = true,
    this.isSummary = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  });

  const ProductCard.wishlist({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 1.1,
    this.leftPosition = 5,
    this.isWishList = true,
    this.height = 150,
    this.isCart = false,
    this.isCatalog = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  });

  const ProductCard.summary({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.leftPosition = 5,
    this.isWishList = false,
    this.height = 80,
    this.isCart = false,
    this.isCatalog = false,
    this.isSummary = true,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product", arguments: product);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ProductImage(
            widthFactor: widthFactor,
            product: product,
            adjustedWidth: adjWidth,
            height: height,
          ),
          ProductBackground(
            adjWidth: adjWidth,
            widgets: [
              ProductInformation(
                product: product,
                fontColor: fontColor,
              ),
              ProductActions(
                product: product,
                fontColor: fontColor,
                isWishList: isWishList,
                isCart: isCart,
                isCatalog: isCatalog,
                isWishlist: isWishList,
                iconColor: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
