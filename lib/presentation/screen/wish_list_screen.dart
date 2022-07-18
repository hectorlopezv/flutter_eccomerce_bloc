import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  static const String routeName = "/wish_list";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => WishListScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: ScrollableAppBar(
        title: "Wishlist",
        children: [
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              if (state is WishlistLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WishlistNotLoading) {
                return Center(
                  child: Text("No products in wishlist"),
                );
              }
              if (state is WishlistLoaded) {
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: ProductCard.wishlist(
                        product: state.wishList.products[index],
                      ),
                    );
                  },
                  itemCount: state.wishList.products.length,
                );
              }
              return Text("Something Went Wrong");
            },
          ),
        ],
      ),
    );
  }
}
