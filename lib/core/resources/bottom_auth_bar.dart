import 'package:flutter/material.dart';

class BottomAuthBar extends StatelessWidget {
  const BottomAuthBar({super.key, required this.ques, required this.ans, required this.location});

  final String ques;
  final String ans;
  final Widget location;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(ques,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff808080)),
        ),

      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>location));
        },
        child: Text(ans,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, decoration: TextDecoration.underline,),
        ),
      ),
        ],
      ),
    );
  }
}
