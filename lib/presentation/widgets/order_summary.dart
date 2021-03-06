import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  final EdgeInsets _padding;
  const OrderSummary({Key? key, padding_user})
      : _padding = padding_user ??
            const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return Column(
            children: [
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: _padding,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          state.cart.subtotalString,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          state.cart.deliveryFeeString,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(50),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            state.cart.totalString,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return Center(
          child: Text("Something Went Wrong"),
        );
      },
    );
  }
}
