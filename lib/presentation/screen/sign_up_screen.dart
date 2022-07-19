import 'package:flutter/material.dart';
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
                child: _UserInput(onChanged: (email) {}, labelText: "Email"),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: _UserInput(onChanged: (name) {}, labelText: "fullName"),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child:
                    _UserInput(onChanged: (zipcode) {}, labelText: "zipCode"),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: _UserInput(onChanged: (city) {}, labelText: "City"),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child:
                    _UserInput(onChanged: (country) {}, labelText: "Country"),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child:
                    _UserInput(onChanged: (address) {}, labelText: "Address"),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
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
      onChanged: (password) {},
      obscureText: true,
      decoration: InputDecoration(
        labelText: "PassWord",
      ),
    );
  }
}
