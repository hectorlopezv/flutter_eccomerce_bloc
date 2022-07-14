import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = "/splash";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () async => Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                "assets/flutter_bird.jpeg",
              ),
              width: 125,
              height: 125,
            ),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(10),
            child: Text(
              "Flutter Ecommerce",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
