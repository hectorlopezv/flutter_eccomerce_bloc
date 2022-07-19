import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/category_model.dart';
import 'package:flutter_eccomerce_bloc/data/models/product_model.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/product_bloc/product_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductBloc _productBloc;
  StreamSubscription? _productSubscription;
  SearchBloc({required ProductBloc productBloc})
      : _productBloc = productBloc,
        super(SearchLoading()) {
    on<LoadSearch>(_onLoadSearch);
    on<SearchProduct>(_onSearchProduct);
    on<UpdateResults>(_onUpdateResults);
  }

  Future<void> _onLoadSearch(event, Emitter<SearchState> emit) async {
    try {
      emit(SearchLoaded());
    } catch (error) {}
  }

  Future<void> _onSearchProduct(
      SearchProduct event, Emitter<SearchState> emit) async {
    List<Product> products = (_productBloc.state as ProductlistLoaded).products;

    if (event.category != null) {
      products = products
          .where((product) => product.category == event.category!.name)
          .toList();
    }
    if (event.productName.isNotEmpty) {
      List<Product> searchResults = products
          .where((product) => product.name
              .toLowerCase()
              .startsWith(event.productName.toLowerCase()))
          .toList();

      emit(SearchLoaded(products: searchResults));
    } else {
      emit(SearchLoaded());
    }
    try {} catch (error) {}
  }

  Future<void> _onUpdateResults(event, Emitter<SearchState> emit) async {
    try {} catch (error) {}
  }

  Future<void> close() async {
    await _productBloc.close();
    super.close();
  }
}
