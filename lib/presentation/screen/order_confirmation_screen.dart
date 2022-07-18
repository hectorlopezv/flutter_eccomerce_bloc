import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/order_summary.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/order_summary_product_card.dart';
import 'package:flutter_svg/svg.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  static const String routeName = "/order-confirmation";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => OrderConfirmationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: ScrollableAppBar(
        title: "Order Confirmation",
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 300,
                    ),
                    Positioned(
                      top: 75,
                      left: (MediaQuery.of(context).size.width - 135) / 2,
                      child: SvgPicture.asset(
                        "assets/svgs/one_up.svg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Positioned(
                      top: 250,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Your Order Is Completed",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Code:  #K321-ekd3",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Thank You for Purchasing on Flutter Ecommerce",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Order Code:  #K321-ekd3",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      OrderSummary(
                        padding_user: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Order Details",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is CartLoaded) {
                            return ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final product = state.cart
                                    .productQuantity(state.cart.products);
                                return OrderSummaryProduct(
                                  product: product.keys.elementAt(index),
                                  quantity: product.values.elementAt(index),
                                );
                              },
                              itemCount: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .length,
                            );
                          }
                          return Text("Something Went Wrong");
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
