import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/screens/body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const Body()),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 200,
            child: Lottie.asset('assets/img/splash.json'),
          ),
          Center(
            child: Text(
              'To Do',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Raleway',
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
