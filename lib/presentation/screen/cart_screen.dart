import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/cart_screen_bottom.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/cart_screen_top.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = "/cart";
  static Route route() {
    return MaterialPageRoute(builder: (context) => CartScreen());
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
                CartScreenTop(),
                CartScreenBottom()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
