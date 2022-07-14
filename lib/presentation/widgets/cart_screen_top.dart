import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/cart_model.dart';
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
              Cart().freeDeliveryString,
              style: Theme.of(context).textTheme.headline5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: const RoundedRectangleBorder(),
                elevation: 0,
              ),
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
        SizedBox(
          height: 370,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CardProductCard(product: Cart().products[index]);
            },
            itemCount: Cart().products.length,
          ),
        ),
      ],
    );
  }
}
