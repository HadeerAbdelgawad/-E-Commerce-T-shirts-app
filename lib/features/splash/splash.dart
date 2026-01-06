import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/resources/app_loading.dart';
import 'package:untitled/core/resources/bottom_nav.dart';
import 'package:untitled/core/resources/cache_helper.dart';
import 'package:untitled/features/auth/login/login.dart';
import 'package:untitled/features/home_nav/screens/home_screen/home.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    Future.delayed(
        Duration(seconds: 5),()async{
          CacheHelper.getToken().then((value){
            if(value.isNotEmpty){
              Navigator.of(context).push(MaterialPageRoute(builder:
              (context)=>HomeBottomNavBar()));
            }else{
              Navigator.of(context).push(MaterialPageRoute(builder:
                  (context)=>LoginScreen()));
            }
          },);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:AppLoading()
    );
  }
}
