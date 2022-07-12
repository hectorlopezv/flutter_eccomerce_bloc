import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);
  void nextRoute(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                nextRoute(context, "/");
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                nextRoute(context, "/cart");
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                nextRoute(context, "/user");
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
