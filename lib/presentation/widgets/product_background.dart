import 'package:flutter/material.dart';

class ProductBackground extends StatelessWidget {
  final double adjWidth;
  final List<Widget> widgets;

  const ProductBackground({
    Key? key,
    required this.adjWidth,
    required this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      margin: EdgeInsets.only(bottom: 5),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
      ),
      child: Container(
        width: adjWidth - 20,
        margin: EdgeInsets.only(bottom: 5),
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
    );
  }
}

