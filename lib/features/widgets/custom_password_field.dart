import 'package:untitled/core/resources/app_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.hint, this.controller});

  final String hint;
  final TextEditingController?controller;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isHidden=true;
  @override
  Widget build(BuildContext context) {
    return AppField(
      controller: widget.controller,
      myColor: Color(0xffE6E6E6),
      hintText: widget.hint,
      obsecureText: isHidden ,
      endIcon: GestureDetector(
        onTap:() {
          setState(() {
            isHidden =! isHidden;
          });
        },
        child: isHidden?
        Icon(Icons.visibility_off_sharp , color: Color(0xffE6E6E6))
            :Icon(Icons.remove_red_eye, color: Color(0xffE6E6E6),),
      ),


    );
  }
}
