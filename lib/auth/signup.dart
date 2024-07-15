import 'package:flutter/material.dart';
import 'package:kiki/auth/auth.dart';
import 'package:kiki/widgets/loading_alert.dart';
import 'package:kiki/widgets/textfields_widget.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splashScreen.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size * 0.15),
                child: Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    SizedBox(height: size * 0.05),
                    Text(
                      "Welcome to Kiki",
                      style: TextStyle(
                        fontSize: size * 0.04,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFC700),
                      ),
                    ),
                    Text(
                      "The Ultimate Symbols Library!",
                      style: TextStyle(
                        fontSize: size * 0.05,
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
                    margin: EdgeInsets.only(top: size * 0.05),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size * 0.08, vertical: size * 0.1),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: size * 0.05,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Lobster"),
                              ),
                            ),
                            SizedBox(height: size * 0.05),
                            TextfieldWidget(
                              controller: _emailController,
                              hitTextName: 'Email',
                              surfixIcon: Icons.person,
                            ),
                            TextfieldWidget(
                              controller: _confirmPasswordController,
                              hitTextName: 'Password',
                              surfixIcon: Icons.key_rounded,
                              obscureText: true,
                            ),
                            TextfieldWidget(
                              controller: _passwordController,
                              hitTextName: 'Confirm password',
                              surfixIcon: Icons.key_rounded,
                              obscureText: true,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // const Text(
                                    //   "Forget password?",
                                    //   style: TextStyle(
                                    //       fontSize: 15,
                                    //       color: Colors.black,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    const SizedBox(),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF680179),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                      height: size * 0.09,
                                      width: size * 0.3,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return const LoadingAlert(
                                                  message:
                                                      'Signing Up please wait...',
                                                );
                                              });
                                          AuthMethods().signUp(
                                              _emailController.text,
                                              _passwordController.text);
                                        },
                                        child: const Center(
                                            child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: size * 0.20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/google.png")
                                  ],
                                ),
                                SizedBox(height: size * 0.03),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()),
                                      );
                                    },
                                    child: const Text("I want to Sign Up!")),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          )),
    );
  }
}
