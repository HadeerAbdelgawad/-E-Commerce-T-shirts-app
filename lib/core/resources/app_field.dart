import 'package:flutter/material.dart';


class AppField extends StatelessWidget {
  const AppField({super.key,
    required this.myColor,
    this.obsecureText=false,
    required this.hintText,
    required this.endIcon, this.controller,
  });

  final Color myColor;
  final bool obsecureText;
  final String hintText;
  final Widget endIcon;
  final TextEditingController?controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        // filled: true,
        suffixIcon: endIcon,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myColor),
            borderRadius: BorderRadius.circular(10)
        ),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myColor),
            borderRadius: BorderRadius.circular(10)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)
        ),

        hintText: hintText,
        hintStyle: TextStyle(
          color: myColor
        )
      ),
    );
  }
}
