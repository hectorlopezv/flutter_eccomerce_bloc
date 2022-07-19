import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/dataProviders/aut_firebase_api.dart';
import 'package:flutter_eccomerce_bloc/data/dataProviders/user_firebase_api.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/auth/auth_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/category/category_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/checkout/checkout_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/product/product_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/user/user_repository.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/category_bloc/category_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/observer_logs_bloc/observer_logs_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/payment_bloc/payment_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/search_bloc/search_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/cubit/login_cubit/login_cubit.dart';
import 'package:flutter_eccomerce_bloc/logic/cubit/signup_cubit/signup_cubit.dart';
import 'package:flutter_eccomerce_bloc/presentation/config/routing/app_router.dart';
import 'package:flutter_eccomerce_bloc/presentation/config/styles/theme.dart';
import 'package:flutter_eccomerce_bloc/presentation/screen/home_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  final storage = await HydratedStorage.build(
    storageDirectory: appDocumentDirectory,
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      const MyApp(),
    ),
    storage: storage,
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(
            userFirebaseApi: UserFirebaseApi(
              firestore: FirebaseFirestore.instance,
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            userRepository: context.read<UserRepository>(),
            authFirebaseApi: AuthFirebaseApi(
              firebaseAuth: FirebaseAuth.instance,
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WishlistBloc>(
            lazy: false,
            create: (_) => WishlistBloc(),
          ),
          BlocProvider<CartBloc>(
            create: (_) => CartBloc()..add(LoadCart()),
          ),
          BlocProvider<CategoryBloc>(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategoryList()),
          ),
          BlocProvider<ProductBloc>(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProductList()),
          ),
          BlocProvider<PaymentBloc>(
            create: (context) => PaymentBloc()
              ..add(
                LoadPaymentMethod(),
              ),
          ),
          BlocProvider<CheckoutBloc>(
            create: (context) => CheckoutBloc(
                checkoutRepository: CheckOutRepository(),
                cartBloc: context.read<CartBloc>(),
                paymentBloc: context.read<PaymentBloc>()),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
              productBloc: context.read<ProductBloc>(),
            )..add(LoadSearch()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          initialRoute: "/splash",
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: theme(),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
