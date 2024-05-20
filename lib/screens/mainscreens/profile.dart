import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/widgets/bottom_navbar.dart';
import 'package:kiki/widgets/user_appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: kikuGradient(),
            child: Column(children: [
              const MyAppBar(),
              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      // padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Pascal Nyame",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.amber),
                        ),
                        SizedBox(height: height * 0.005),
                        const Text(
                          "Graphic designer  inspired to create \n innovative content for future generations.",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(height: height * 0.01),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              const SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileCard(
                      profileName: "Akwasi Pascal",
                      icon: Icons.person_2_rounded,
                    ),
                    ProfileCard(
                      profileName: "pascal@gmail.com",
                      icon: Icons.email,
                    ),
                    ProfileCard(
                      profileName: "Contact Us",
                      icon: Icons.contact_page,
                    ),
                    ProfileCard(
                      profileName: "About us",
                      icon: Icons.history,
                    ),
                    ProfileCard(
                      profileName: "Sign out",
                      icon: Icons.logout_outlined,
                    ),
                  ],
                ),
              ),
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