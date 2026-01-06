import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/network/dio_helper.dart';
import 'package:untitled/features/auth/auth_cubit.dart';
import 'package:untitled/features/auth/signup/signup.dart';
import 'package:untitled/features/home_nav/screens/home_screen/home.dart';
import 'package:untitled/features/splash/splash.dart';
import 'features/auth/login/login.dart';
import 'features/home_nav/screens/cart_cubit.dart';


void main() {

  //flutter 5 pending: so runapp once apen initalize all pending
  //to avoid not initialize pending error  ملحقش يعرف
  WidgetsFlutterBinding.ensureInitialized();//
  DioHelper.initDio();//once app open initialize dio

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // AuthCubit().login();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
          home: Splash()
      ),
    );
  }
}
