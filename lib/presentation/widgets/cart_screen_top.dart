import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/cart_product_card.dart';

class CartScreenTop extends StatelessWidget {
  const CartScreenTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add \$20.0 for FREE Shipping",
              style: Theme.of(context).textTheme.headline5,
            ),
          
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: const RoundedRectangleBorder(),
                  elevation: 0),
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: Text(
                "Add More Items",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CardProductCard(
          product: Product.products[0],
        ),
        CardProductCard(
          product: Product.products[0],
        ),
      ],
    );
  }
}
