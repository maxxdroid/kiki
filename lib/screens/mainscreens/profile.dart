import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/widgets/bottom_navbar.dart';
import 'package:kiki/widgets/user_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../auth/login.dart';
import '../landingscreens/AboutUsPage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? ' ';
    });
  }

  Future<void> _removeUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      _username = ' ';
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    User? user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: kikuGradient(),
              child: Column(children: [
                const MyAppBar(),
          if (user != null) ...[
                SizedBox(height: height * 0.05),
                const Text(
                  "USER PROFILE",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),

                  SizedBox(height: height * 0.07),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileCard(
                          profileName: _username,
                          icon: Icons.person_2_rounded,
                        ),
                        ProfileCard(
                          profileName: user.email ?? "Email not available",
                          icon: Icons.email,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(() => const AboutUsPage());
                          },
                          child: const ProfileCard(
                            profileName: "About us",
                            icon: Icons.history,
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                        CustomLoginButton(
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance.signOut();
                              Get.offAll(() => const Login());
                              _removeUsername();
                            } catch (e) {
                              print('Error signing out: $e');
                              // You might want to show an error message to the user here
                            }
                          },
                          name: 'Sign Out',
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  // User is not signed in, show sign-in button
                  SizedBox(height: height * 0.3),
                  const Text(
                    "Please sign in to view your profile",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  CustomLoginButton(
                    onPressed: () {
                      Get.to(() => const Login());
                    }, name: 'Log In',
                  ),
                ],
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: width,
                  height: height * 0.1,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFC700),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height * 0.08,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
              ),
            ),
            const MyBottomNavBar(selectedIndex: 3)
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String profileName;
  final IconData icon;
  const ProfileCard({
    super.key,
    required this.profileName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            child: Center(
          child: ListTile(
            title: Text(profileName),
            leading: Icon(icon),
          ),
        )),
      ),
    );
  }
}


class CustomLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;

  const CustomLoginButton({super.key, required this.onPressed, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        elevation: 0,
      ),
      child:  Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}