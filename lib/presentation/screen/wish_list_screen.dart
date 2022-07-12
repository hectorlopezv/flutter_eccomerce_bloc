import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  static const String routeName = "/wish_list";
  static Route route() {
    return MaterialPageRoute(builder: (context) => WishListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Flutter Ecommerce"),
      bottomNavigationBar: CustomNavBar(),
      body: Center(
        child: Text("wish_list"),
      ),
    );
  }
}
