import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/cart_product_card.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = "/cart";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => CartScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  "Go to Checkout",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ScrollableAppBar(
        title: "Cart",
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Column(
              children: [
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is CartLoaded) {
                      return Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.cart.freeDeliveryString,
                                    style:
                                        Theme.of(context).textTheme.headline5,
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
                                    final product = state.cart
                                        .productQuantity(state.cart.products);
                                    return CardProductCard(
                                      product: product.keys.elementAt(index),
                                      quantity: product.values.elementAt(index),
                                    );
                                  },
                                  itemCount: state.cart
                                      .productQuantity(state.cart.products)
                                      .keys
                                      .length,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Divider(
                                thickness: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Subtotal",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        Text(
                                          state.cart.subtotalString,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery Fee",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        Text(
                                          state.cart.deliveryFeeString,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                          )
                        ],
                      );
                    }
                    return Text("Something went Wrong");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
