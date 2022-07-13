import 'package:flutter/material.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/catalog_screen.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/product_screen.dart';

class HeroCarrouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;

  const HeroCarrouselCard({Key? key, this.category, this.product})
      : assert(category == null || product == null,
            'Cannot provide category  and a product\n'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = category != null
        ? category!.imageUrl
        : product != null
            ? product!.imageUrl
            : "";
    final name = category != null ? category!.name : ""; 
    return InkWell(
      onTap: () {
        if (category != null) {
          Navigator.pushNamed(
            context,
            CatalogScreen.routeName,
            arguments: category,
          );
        } else if (product != null) {
          Navigator.pushNamed(
            context,
            ProductScreen.routeName,
            arguments: product,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 5,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(imageUrl, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
