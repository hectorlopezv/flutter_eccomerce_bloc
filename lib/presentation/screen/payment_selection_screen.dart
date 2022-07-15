import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eccomerce_bloc/data/models/paymeny_method_model.dart';
import 'package:flutter_eccomerce_bloc/logic/blocs/payment_bloc/payment_bloc.dart';
import 'package:flutter_eccomerce_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:pay/pay.dart';

class PaymentSelectionScreen extends StatelessWidget {
  const PaymentSelectionScreen({Key? key}) : super(key: key);

  static const String routeName = "/payment-selection";
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => PaymentSelectionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableAppBar(
        title: "Payment",
        children: [
          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              if (state is PaymentLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is PaymentLoaded) {
                return ListView(
                  padding: EdgeInsets.all(20),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Platform.isIOS
                        ? SizedBox(height: 10)
                        : SizedBox(
                            height: 10,
                          ),
                    Platform.isAndroid
                        ? RawGooglePayButton(
                            style: GooglePayButtonStyle.black,
                            type: GooglePayButtonType.pay,
                            onPressed: () {
                              context.read<PaymentBloc>().add(
                                    SelectPaymentMethod(
                                      paymentMethod: PaymentMethod.google_pay,
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                          )
                        : SizedBox(
                            height: 10,
                          ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PaymentBloc>().add(
                              SelectPaymentMethod(
                                paymentMethod: PaymentMethod.credit_car,
                              ),
                            );
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Pay with Credit Card",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: Text("Something Went Wrong"),
              );
            },
          )
        ],
      ),
    );
  }
}
