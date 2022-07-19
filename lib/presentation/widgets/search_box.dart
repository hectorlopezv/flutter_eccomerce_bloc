import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/search_bloc/search_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/product_card.dart';

class SearchBox extends StatelessWidget {
  final Category? category;
  const SearchBox({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SearchLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          context.read<SearchBloc>().add(
                                SearchProduct(
                                  productName: value,
                                  category: category,
                                ),
                              );
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Search For Products",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                state.products.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: ProductCard.catalog(
                              product: state.products[index],
                              widthFactor: 1.1,
                            ),
                          );
                        },
                      )
                    : SizedBox(),
              ],
            ),
          );
        }

        return Text("Something Went Wrong");
      },
    );
  }
}
