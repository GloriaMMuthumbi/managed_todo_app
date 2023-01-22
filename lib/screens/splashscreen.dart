import 'dart:async';
import 'package:flutter/material.dart';
import 'package:managed_app/screens/welcome_screen.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  navigationPage() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (Route<dynamic> route) => false);
  }

  startTime() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.centerRight,
          colors: [Colors.white, Colors.white],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 35.h,
          ),
          Image.asset(
            "assets/images/logo.png",
            height: 200,
            width: 200,
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Managed",
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Aclonica',
              ),
            ),
          )),
        ],
      ),
    ));
  }
}
