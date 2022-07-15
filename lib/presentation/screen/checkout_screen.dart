import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  static const String routeName = "/checkout";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => CheckOutScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ScrollableAppBar(
          title: "CheckOut",
          children: [],
        ),
      ),
    );
  }
}
