import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/category/category_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/product/product_repository.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/category_bloc/category_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/observer_logs_bloc/observer_logs_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/config/routing/app_router.dart';
import 'package:flutter_eccomerce_bloc/presentation/config/styles/theme.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
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
        BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(categoryRepository: CategoryRepository())
                ..add(LoadCategoryList()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(productRepository: ProductRepository())
                ..add(LoadProductList()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/splash",
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: theme(),
        home: HomeScreen(),
      ),
    );
  }
}
