import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_card.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName = "/catalog";
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CatalogScreen(category: category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: ScrollableAppBar(
        title: category.name,
        children: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductlistLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProductlistLoaded) {
                return GridView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.15,
                  ),
                  children: state.products
                      .map(
                        (product) => ProductCard.catalog(
                          product: product,
                        ),
                      )
                      .where(
                        (element) => element.product.category == category.name,
                      )
                      .toList(),
                );
              }

              return Center(
                child: Text("Something Went Wront"),
              );
            },
          ),
        ],
      ),
    );
  }
}
