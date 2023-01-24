import 'package:flutter/material.dart';
import 'package:managed_app/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
            width: 325,
            height: 325,
          ),
            SizedBox(height: 8.h,),
            RichText(
              text: const TextSpan (
                style: TextStyle (fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w700),
                children: [
                  TextSpan (text: "Manage and Prioritize your tasks anywhere with ",
                  style: TextStyle(color: Colors.black)),
                  TextSpan (text: "Managed", style: TextStyle(color: Color(0xffFFAC48)))
                ]
              ),
            ),
            SizedBox (height: 2.h,),
            const Text ("Increase your productivity by managing and prioritizing your tasks in one place.",
            style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 5.h,),
            TextButton (
                onPressed: () {
                  Navigator.push(
                      context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffFFAC48),
                padding: const EdgeInsets.fromLTRB(49, 19, 49, 19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ), child:  Text("Get Started".toUpperCase(),
            style: const TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w800, fontSize: 16,),
            ),
            )
          ],
      ),
        )
      )
    );
  }
}