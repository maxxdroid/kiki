import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kiki/consts/const_widgets.dart';

import '../../auth/login.dart';
import '../mainscreens/kiki_home.dart';

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
    checkAuthStatus();
  }

  void checkAuthStatus() async {
    // Delay for 3 seconds (3000 milliseconds)
    await Future.delayed(const Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in, navigate to home screen
      Get.offAll(const KikiHome(), transition: Transition.fadeIn);
    } else {
      // No user is signed in, navigate to login screen
      Get.offAll(const Login(), transition: Transition.fadeIn);
    }
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