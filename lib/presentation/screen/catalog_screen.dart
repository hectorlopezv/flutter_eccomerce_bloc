import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_card.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName = "/catalog";
  static Route route({required Category category}) {
    return MaterialPageRoute(
        builder: (context) => CatalogScreen(category: category));
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: ScrollableAppBar(
        title: category.name,
        children: [
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  product: categoryProducts[index],
                  widthFactor: 2.2,
                ),
              );
            },
            itemCount: categoryProducts.length,
          ),
        ],
      ),
    );
  }
}
