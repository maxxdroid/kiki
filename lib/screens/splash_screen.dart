import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kiki/consts/const_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  displaySplash () {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "welcome");
    });
  }

  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: kikuGradient(),
            child: Center(
              child: Image.asset(
              height: double.infinity,
              width: double.infinity,
              "assets/images/pattern.png",
              fit: BoxFit.cover,
            ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset("assets/images/kiki.png"),
                ),
                const SizedBox(height: 100,),
                const SizedBox(
                  child: Text(
                    "WELCOME",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      letterSpacing: 10
                    ),
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}