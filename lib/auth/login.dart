import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kiki/auth/auth.dart';
import 'package:kiki/auth/signUp.dart';
import 'package:kiki/screens/mainscreens/kiki_home.dart';
import 'package:kiki/widgets/loading_alert.dart';
import 'package:kiki/widgets/textfields_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splashScreen.png'),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.15),
                  child: Column(
                    children: [
                      Image.asset("assets/images/logo.png"),
                      SizedBox(height: height * 0.05),
                      Text(
                        "Welcome to Kiki",
                        style: TextStyle(
                          fontSize: height * 0.04,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFC700),
                        ),
                      ),
                      Text(
                        "The Ultimate Symbols Library!",
                        style: TextStyle(
                          fontSize: height * 0.05,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(0))),
                      margin: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: height * 0.08, vertical: height * 0.1),
                          child: Column(
                            children: [
                              //SizedBox(height: height * 0.05),
                              const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xFF680179),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Lobster"),
                              ),
                              const Text(
                                "Sign in to your Account",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Lobster"),
                              ),
                              SizedBox(height: height * 0.03),
        
                              TextfieldWidget(
                                hitTextName: 'Username',
                                surfixIcon: Icons.person,
                                controller: _emailController,
                              ),
                              TextfieldWidget(
                                hitTextName: 'Password',
                                surfixIcon: Icons.key_rounded,
                                obscureText: true,
                                controller: _passwordController,
                              ),
        
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Forget password ?",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return const LoadingAlert(
                                                message:
                                                    'Logging in please wait...',
                                              );
                                            });
                                        AuthMethods().signIn(
                                            _emailController.text,
                                            _passwordController.text);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF680179),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        height: 50,
                                        width: 150,
                                        child: const Center(
                                            child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.1),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const KikiHome(),
                                      transition: Transition.circularReveal);
                                },
                                child: const Text(
                                  "Skip Login",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ),
                              SizedBox(height: height * 0.05),
        
                              const Divider(
                                thickness: 2,
                                color: Color(0xFF680179),
                              ),
                              // SizedBox(height: height * 0.01),
                              // const Text(
                              //   "Sign in with Social Instead.....",
                              //   style:
                              //       TextStyle(fontSize: 15, color: Colors.black),
                              // ),
                              // SizedBox(height: height * 0.01),
                              // const Divider(
                              //   thickness: 2,
                              //   color: Color(0xFF680179),
                              // ),
        
                              // SizedBox(height: height * 0.05),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Image.asset("assets/images/apple.png"),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     Image.asset("assets/images/facebook.png"),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     Image.asset("assets/images/google.png")
                              //   ],
                              // ),
                              // SizedBox(height: height * 0.05),
        
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignUp()),
                                    );
                                  },
                                  child: const Text("I want to Sign Up!")),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
