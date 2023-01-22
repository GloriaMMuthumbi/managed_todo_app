import 'package:flutter/material.dart';
import 'package:managed_app/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetowelcome(); //comment this out to work on app without loading splash screen
  }

  _navigatetowelcome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Image.asset('assets/images/logo.png',
            width: 239,
            height: 189,
          ),
            )
        );
  }
}
