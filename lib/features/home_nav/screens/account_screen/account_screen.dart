import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/resources/cache_helper.dart';
import 'package:untitled/features/auth/login/login.dart';
import 'package:untitled/features/home_nav/screens/home_cubit.dart';


class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actionsPadding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          leading: SizedBox.shrink(),
          title: Text(
            'Account',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),

          centerTitle: true,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 30,),
            Container(
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.pages_sharp),
                    ),

                    Text(
                      "My Orders",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.arrow_forward_ios,color:Color(0xffB3B3B3)),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: Color(0xffE6E6E6), thickness: 8,),
            ),

            Container(
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.perm_contact_cal_outlined),
                    ),

                    Text(
                      "My Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                         ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.arrow_forward_ios,color:Color(0xffB3B3B3)),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: Color(0xffE6E6E6)),
            ),

            Container(
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.home ),
                    ),

                    Text(
                      "Address Book",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                         ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.arrow_forward_ios,color:Color(0xffB3B3B3)),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: Color(0xffE6E6E6)),
            ),

            Container(
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.help ),
                    ),

                    Text(
                      "FAQs",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.arrow_forward_ios,color:Color(0xffB3B3B3)),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: Color(0xffE6E6E6)),
            ),

            Container(
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.headset_mic_outlined),
                    ),

                    Text(
                      "Help Center",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:
                      Icon(Icons.arrow_forward_ios, color: Color(0xffB3B3B3),),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: Color(0xffE6E6E6), thickness: 8,),
            ),


            // GestureDetector(
            //   onTap:
            //       () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context)
            //     {return LoginScreen();
            //     }
            //     ));
            //   },
            //   child: Container(
            //     child:Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //       child: Row(
            //         children: [
            //
            //           Padding(
            //             padding: const EdgeInsets.all(5),
            //             child: Icon(Icons.logout_outlined),
            //           ),
            //
            //
            //           Text(
            //             "Logout",
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w400),
            //           ),
            //
            //
            //
            //
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (context)=> AlertDialog(
              icon: SvgPicture.asset('assets/images/Vector.svg'),
              title: Text(
                'Logout?',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              content: Text('Are you sure you want to logout?',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff808080)),
                textAlign: TextAlign.center),
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  TextButton(
                    onPressed: () async {
                      await CacheHelper.deleteToken();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                            (route) => false,
                      );
                      AnimatedSnackBar.material(
                        'Logged out successfully!',
                        type: AnimatedSnackBarType.success,
                      ).show(context);
                    },

                    style: TextButton.styleFrom(backgroundColor: Color(0xffED1010)),
                    child: Text(
                      'Yes, Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),


                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.transparent, side: const BorderSide(
                      color: Color(0xffCCCCCC), // Choose your color
                      width: 1,           // Choose your width
                      ),  ),

                    child: Text(
                      'No, Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],)


              ],
            ));
          },

          child: Container(
            decoration: BoxDecoration(
              boxShadow:[BoxShadow(color:Color(0xffd0d0d0),spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), )]
            ),
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(Icons.logout_outlined, color: Color(0xffED1010),),
                  ),


                  Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffED1010)),
                  ),




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

