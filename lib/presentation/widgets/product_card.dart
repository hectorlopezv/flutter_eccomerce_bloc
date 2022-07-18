import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';

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

class ProductBackground extends StatelessWidget {
  final double adjWidth;
  final List<Widget> widgets;

  const ProductBackground({
    Key? key,
    required this.adjWidth,
    required this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      margin: EdgeInsets.only(bottom: 5),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
      ),
      child: Container(
        width: adjWidth - 20,
        margin: EdgeInsets.only(bottom: 5),
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
    );
  }
}

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
