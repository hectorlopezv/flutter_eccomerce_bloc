import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/cart_screen.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/catalog_screen.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/home_screen.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/product_screen.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/wish_list_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: "/error"),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
      ),
    );
  }
}
