import 'package:flutter/material.dart';
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
    TextEditingController controller, {
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
              controller: controller,
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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  "Order Now",
                  style: Theme.of(context).textTheme.headline3,
                ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Information",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _buildTextFormFiled("Email", context, emailController),
                    _buildTextFormFiled("Full Name", context, nameController),
                    Text(
                      "Delivery Innformation",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _buildTextFormFiled("Address", context, addressController),
                    _buildTextFormFiled("City", context, cityController),
                    _buildTextFormFiled("Country", context, countryController),
                    _buildTextFormFiled("ZipCode", context, zipCodeController),
                    Text(
                      "Order Summary",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    OrderSummary()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
