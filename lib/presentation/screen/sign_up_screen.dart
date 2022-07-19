import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/cubit/signup_cubit/signup_cubit.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_nav_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const String routeName = "/signUp";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: ScrollableAppBar(
        title: "signUp",
        children: [
          Column(
            children: [
              Container(
                child: Builder(builder: (context) {
                  final state = context.watch<SignupCubit>().state;
                  return _UserInput(
                    onChanged: (email) {
                      context.read<SignupCubit>().onUserChanged(
                            state.user!.copyWith(email: email),
                          );
                    },
                    labelText: "Email",
                  );
                }),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Builder(builder: (context) {
                  final state = context.watch<SignupCubit>().state;
                  return _UserInput(
                      onChanged: (name) {
                        context.read<SignupCubit>().onUserChanged(
                              state.user!.copyWith(fullName: name),
                            );
                      },
                      labelText: "fullName");
                }),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Builder(builder: (context) {
                  final state = context.watch<SignupCubit>().state;
                  return _UserInput(
                      onChanged: (zipcode) {
                        context.read<SignupCubit>().onUserChanged(
                              state.user!.copyWith(zipCode: zipcode),
                            );
                      },
                      labelText: "zipCode");
                }),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Builder(builder: (context) {
                  final state = context.watch<SignupCubit>().state;
                  return _UserInput(
                      onChanged: (city) {
                        context.read<SignupCubit>().onUserChanged(
                              state.user!.copyWith(city: city),
                            );
                      },
                      labelText: "City");
                }),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Builder(builder: (context) {
                  final state = context.watch<SignupCubit>().state;
                  return _UserInput(
                      onChanged: (country) {
                        context.read<SignupCubit>().onUserChanged(
                              state.user!.copyWith(country: country),
                            );
                      },
                      labelText: "Country");
                }),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Builder(builder: (context) {
                  final state = context.watch<SignupCubit>().state;
                  return _UserInput(
                      onChanged: (address) {
                        context.read<SignupCubit>().onUserChanged(
                              state.user!.copyWith(address: address),
                            );
                      },
                      labelText: "Address");
                }),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: _PasswordInput(),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<SignupCubit>().LoginWithCredentialas(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Colors.black,
                  fixedSize: Size(200, 40),
                ),
                child: Text("SignUp"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _UserInput extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  _UserInput({
    Key? key,
    required this.onChanged,
    required this.labelText,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (password) {
        context.read<SignupCubit>().onPassWordChanged(password);
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "PassWord",
      ),
    );
  }
}
