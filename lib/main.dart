import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/config/routing/app_router.dart';
import 'package:flutter_eccomerce_bloc/presentation/config/styles/theme.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(
          create: (context) => WishlistBloc()..add(LoadWishList()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(LoadCart()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: theme(),
        home: HomeScreen(),
      ),
    );
  }
}
