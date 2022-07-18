import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Function(String) onchaged;
  final bool obscureText;
  final TextInputType textInputType;
  final IconData icon;
  final bool enabled;
  const CustomTextFormField({
    Key? key,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.icon = Icons.access_alarm,
    this.enabled = true,
    required this.label,
    required this.onchaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
