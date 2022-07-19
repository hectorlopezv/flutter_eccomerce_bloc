import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/category_bloc/category_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/hero_carousell_card.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/products_carrousel.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/search_box.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => HomeScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: CustomNavBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ScrollableAppBar(
            title: "Flutter Ecommerce",
            children: [
              _heroCarrousel(),
              SearchBox(),
              const SectionTitle(
                title: "RECOMMENDED",
              ),
              _productCarrousel(isRecommended: true),
              const SectionTitle(
                title: "Most Popular",
              ),
              _productCarrousel(isPopular: true),
            ],
          ),
        ),
      ),
    );
  }
}

class _productCarrousel extends StatelessWidget {
  final bool isRecommended;
  final bool isPopular;

  const _productCarrousel({
    Key? key,
    this.isRecommended = false,
    this.isPopular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductlistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductlistLoaded) {
          return ProductsCarrousel(
            products: state.products
                .where(
                  (product) =>
                      isRecommended ? product.isRecommended : product.isPopular,
                )
                .toList(),
          );
        }
        return Center(
          child: Text("Something Went Wront"),
        );
      },
    );
  }
}

class _heroCarrousel extends StatelessWidget {
  const _heroCarrousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategorylistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CategorylistLoaded) {
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
            ),
            items: state.categories
                .map((category) => HeroCarrouselCard(category: category))
                .toList(),
          );
        }

        return Center(
          child: Text("Something Went Wront"),
        );
      },
    );
  }
}
