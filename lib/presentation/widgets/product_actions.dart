import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductActions extends StatelessWidget {
  const ProductActions({
    Key? key,
    required this.product,
    required this.fontColor,
    required this.isWishList,
    required this.isCatalog,
    required this.isWishlist,
    required this.isCart,
    required this.iconColor,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final Color fontColor;
  final bool isWishList;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final Color iconColor;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.read<CartBloc>().add(
                  AddProductToCartList(product),
                );
          },
          icon: Icon(
            Icons.add_circle,
            color: Colors.white,
          ),
        ),
        isWishList
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )
            : SizedBox()
      ],
    );
  }
}

