import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/resources/signup_loading.dart';

import '../../../core/resources/app_field.dart';
import '../../../core/resources/bottom_auth_bar.dart';
import '../../../core/resources/snack_bar.dart';
import '../../widgets/custom_password_field.dart';
import '../login/login.dart';
import '../auth_cubit.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>AuthCubit(),

      child: Scaffold(

        backgroundColor: Colors.white,

        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context,state){
            if(state is SignUpStateFailure){
              showMySnackBar(msg: "Error SignUp",
                  type: AnimatedSnackBarType.error,
                  context: context);
            }
            if(state is SignUpStateSuccess){
              showMySnackBar(msg: "Account created successfully",
                  type: AnimatedSnackBarType.success,
                  context: context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
            }

          },

            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              //read -> read specific thing
              //watch -> watch specific thing
              if (state is SignUpStateLoading) {
                return Center(child: SignupLoading(),);
              }

          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),

                    Text(
                      'Let’s create your account.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),

                    SizedBox(height: 35),

                    Text(
                      'Full Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                    AppField(
                      myColor: Color(0xffE6E6E6),
                      hintText: 'Enter your full name',
                      endIcon: SizedBox(),
                      controller: cubit.userNameControl,
                    ),

                    SizedBox(height: 35),

                    Text(
                      'Email',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                    AppField(
                      myColor: Color(0xffE6E6E6),
                      hintText: 'Enter your email address',
                      endIcon: SizedBox(),
                      controller: cubit.emailControl,
                    ),

                    SizedBox(height: 35),

                    Text(
                      'Password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                    CustomPasswordField(hint: 'Enter your password',
                      controller: cubit.passwordControl,),

                    SizedBox(height: 35),

                    Text(
                      'Confirm Password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                    CustomPasswordField(hint: 'Enter your password',
                    controller: cubit.confirmPasswordControl,),

                    SizedBox(height: 50),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          cubit.signup();
                        },
                        child: Container(
                          width: 350,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xff3669C9),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: const Center(
                            child: Text(
                              'Create Account',
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
        bottomNavigationBar: BottomAuthBar(ques: 'Already have an account? ',
          ans: ' Log In', location: LoginScreen(),),
      ),
    );
  }
}
