import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';

class CardProductCard extends StatelessWidget {
  final Product product;
  const CardProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
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
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                            RemoveProductFromCartList(product),
                          );
                    },
                    icon: const Icon(Icons.remove_circle),
                  );
                },
              ),
              Text(
                "1",
                style: Theme.of(context).textTheme.headline5,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              AddProductToCartList(product),
                            );
                      },
                      icon: const Icon(Icons.add_circle),
                    );
                  }
                  if (state is CartLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return Text("Something went Wrong");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
