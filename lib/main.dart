import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:managed_app/screens/splashscreen.dart';
import 'package:managed_app/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 15000,
        splash: Column(
          children: [
            Image.asset('assets/images/logo.png',
            width: 239,
            height: 189,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("Managed",
              style: TextStyle(fontSize: 28, fontFamily: 'Aclonica',),),
            )
          ],
        ),
          nextScreen: WelcomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}