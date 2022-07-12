import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/";
  static Route route() {
    return MaterialPageRoute(builder: (context) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Flutter Ecommerce"),
      bottomNavigationBar: CustomNavBar(),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
