import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/auth/auth_repository.dart';
import 'package:flutter_eccomerce_bloc/data/repositories/user/user_repository.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/profile_bloc/profile_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/profile";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
            authBloc: context.read<AuthBloc>(),
            userRepository: context.read<UserRepository>())
          ..add(
            LoadProfile(
              context.read<AuthBloc>().state.authUser,
            ),
          ),
        child: ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: ScrollableAppBar(
        title: "Profile",
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProfileLoaded) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<AuthRepository>().signOut();
                  },
                  child: Text("Signout"),
                );
              }
              if (state is ProfileUnathenticated) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "you are not logged in",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        primary: Colors.black,
                        fixedSize: Size(200, 40),
                      ),
                      child: Text("Login"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signUp");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        primary: Colors.blueAccent,
                        fixedSize: Size(200, 40),
                      ),
                      child: Text("SignUp"),
                    )
                  ],
                );
              }
              return Text("Something Went Wrong");
            },
          )
        ],
      ),
    );
  }
}
