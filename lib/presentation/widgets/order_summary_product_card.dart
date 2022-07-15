import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';

class OrderSummaryProduct extends StatelessWidget {
  final Product product;
  final int quantity;
  const OrderSummaryProduct({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Qty: $quantity",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "\$${product.price}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        ],
      ),
    );
  }
}
