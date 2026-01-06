import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/resources/app_field.dart';
import 'package:untitled/core/resources/app_loading.dart';
import 'package:untitled/core/resources/bottom_auth_bar.dart';
import 'package:untitled/core/resources/snack_bar.dart';
import 'package:untitled/features/auth/auth_cubit.dart';
import 'package:untitled/core/resources/bottom_nav.dart';
import 'package:untitled/features/widgets/custom_password_field.dart';

import '../signup/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: BlocConsumer<AuthCubit, AuthState>(

          listener: (context,state){
            if(state is LoginStateFailure){
              showMySnackBar(msg: "Error Login",
                  type: AnimatedSnackBarType.error,
                  context: context);
            }
            if(state is LoginStateSuccess){
              showMySnackBar(msg: "Login in success",
                  type: AnimatedSnackBarType.success,
                  context: context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeBottomNavBar()));
            }

          },
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();
            //read -> read specific thing
            //watch -> watch specific thing
            if (state is LoginStateLoading) {
              return Center(child: AppLoading(),);
            }


            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 25),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login to your account',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight
                            .w600),
                      ),

                      Text(
                        'It’s great to see you again.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff808080),
                        ),
                      ),

                      SizedBox(height: 35),

                      Text(
                        'UserName',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight
                            .w500),
                      ),

                      AppField(
                        myColor: Color(0xffE6E6E6),
                        hintText: 'Enter your user name',
                        endIcon: SizedBox(),
                        controller: cubit.userNameControl,
                      ),

                      SizedBox(height: 35),

                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight
                            .w500),
                      ),

                      CustomPasswordField(hint: 'Enter your password',
                        controller: cubit.passwordControl,
                      ),

                      SizedBox(height: 50),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            cubit.login();
                          },
                          child: Container(
                            width: 350,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xff3669C9),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10))
                            ),
                            child: const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),




                    ],
                  ),
                ),
              ),
            )
            ;
          }
        ),
        bottomNavigationBar: BottomAuthBar(ques: 'Don’t have an account? ',
            ans: 'Join', location: SignupScreen(),),
      ),
    );
  }
}
