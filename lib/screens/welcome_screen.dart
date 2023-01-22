import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/images/notebook.png',
            width: 350,
            height: 350,
          ),
            SizedBox(height: 40,),
            RichText(
              text: TextSpan (
                style: TextStyle (fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w700),
                children: [
                  TextSpan (text: "Manage and Prioritize your tasks anywhere with ",
                  style: TextStyle(color: Colors.black)),
                  TextSpan (text: "Managed", style: TextStyle(color: Color(0xffFFAC48)))
                ]
              ),
            ),
            SizedBox (height: 35,),
            Text ("Increase your productivity by managing and prioritizing your tasks in one place.",
            style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 55,),
            TextButton (
                onPressed: () {}, child: Text("Get Started".toUpperCase(),
            style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w800, fontSize: 16,),
            ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffFFAC48),
                padding: EdgeInsets.fromLTRB(49, 19, 49, 19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            )
          ],
      ),
        )
      )
    );
  }
}