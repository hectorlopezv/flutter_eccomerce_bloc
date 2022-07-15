import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/order_summary.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  static const String routeName = "/checkout";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => CheckOutScreen(),
        settings: RouteSettings(name: routeName));
  }

  Widget _buildTextFormFiled(
    String label,
    BuildContext context,
    Function(String)? onchaged, {
    bool obscureText = false,
    TextInputType textInputType = TextInputType.text,
    IconData icon = Icons.access_alarm,
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(label, style: Theme.of(context).textTheme.bodyText1),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onchaged,
              obscureText: obscureText,
              keyboardType: textInputType,
              enabled: enabled,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutOrderLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is CheckoutOrderLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        context.read<CheckoutBloc>().add(
                              ConfirmCheckoutOrder(checkout: state.checkout),
                            );
                      },
                      child: Text(
                        "Order Now",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      "Something Went Wrong...",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ScrollableAppBar(
          title: "CheckOut",
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is CheckoutOrderLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CheckoutOrderLoaded) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer Information",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          _buildTextFormFiled(
                            "Email",
                            context,
                            (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateCheckoutOrder(email: value));
                            },
                          ),
                          _buildTextFormFiled(
                            "Full Name",
                            context,
                            (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateCheckoutOrder(fullName: value));
                            },
                          ),
                          Text(
                            "Delivery Innformation",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          _buildTextFormFiled(
                            "Address",
                            context,
                            (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateCheckoutOrder(address: value));
                            },
                          ),
                          _buildTextFormFiled(
                            "City",
                            context,
                            (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateCheckoutOrder(city: value));
                            },
                          ),
                          _buildTextFormFiled(
                            "Country",
                            context,
                            (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateCheckoutOrder(country: value));
                            },
                          ),
                          _buildTextFormFiled(
                            "ZipCode",
                            context,
                            (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateCheckoutOrder(zipCode: value));
                            },
                          ),
                          Container(),
                          Text(
                            "Order Summary",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          OrderSummary()
                        ],
                      );
                    }

                    return Center(
                      child: Text("Something Went Wrong"),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
