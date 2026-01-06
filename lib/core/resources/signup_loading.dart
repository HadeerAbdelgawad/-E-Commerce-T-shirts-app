import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SignupLoading extends StatelessWidget {
  const SignupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/json/login_and_signup.json'));
  }
}
