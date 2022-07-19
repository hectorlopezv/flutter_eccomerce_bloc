import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/cubit/login_cubit/login_cubit.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "/login";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: ScrollableAppBar(
        title: "Login",
        children: [
          Column(
            children: [
              Container(
                child: _EmailInput(),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: _PasswordInput(),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Colors.black,
                ),
                onPressed: () {
                  context.read<LoginCubit>().LoginWithCredentialas(context);
                },
                child: Text("Login"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (email) {
        context.read<LoginCubit>().onEmailChanged(email);
      },
      decoration: InputDecoration(
        labelText: "Email",
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (password) {
        context.read<LoginCubit>().onPassWordChanged(password);
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "PassWord",
      ),
    );
  }
}
