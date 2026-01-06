import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/json/loading40_paperplane.json'));
  }
}
