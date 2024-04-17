import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/screens/bookmarks.dart';
import 'package:kiki/screens/categories.dart';
import 'package:kiki/screens/kiki_home.dart';
import 'package:kiki/screens/profile.dart';

class MyBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  const MyBottomNavBar({required this.selectedIndex, super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // color: Colors.red,
        height: 65,
        margin: const EdgeInsets.only(right: 35, left: 35, bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.to(const KikiHome(), transition: Transition.fadeIn);
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: _selectedIndex == 0
                  ? Card(
                      color: defaultColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Row(
                          children: [
                            ImageIcon(
                                color: Colors.white,
                                size: 30,
                                AssetImage("assets/images/home_icon.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: ImageIcon(
                          size: 30, AssetImage("assets/images/home_icon.png")),
                    ),
            ),
            InkWell(
              onTap: () {
                Get.to(const KikiCategories(), transition: Transition.fadeIn);
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: _selectedIndex == 1
                  ? Card(
                      color: defaultColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10),
                        child: Row(
                          children: [
                            ImageIcon(
                                color: Colors.white,
                                size: 30,
                                AssetImage("assets/images/symbols_icon.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Symbols",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  : const ImageIcon(
                      // color: Colors.white,
                      size: 30,
                      AssetImage("assets/images/symbols_icon.png")),
            ),
            InkWell(
              onTap: () {
                Get.to(const Bookmarks(), transition: Transition.fadeIn);
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: _selectedIndex == 2
                  ? Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      color: defaultColor,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10),
                        child: Row(
                          children: [
                            ImageIcon(
                                color: Colors.white,
                                size: 30,
                                AssetImage("assets/images/bookmark_icon.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Bookmarks",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  : const ImageIcon(
                      // color: Colors.white,
                      size: 30,
                      AssetImage("assets/images/bookmark_icon.png")),
            ),
            InkWell(
                onTap: () {
                  Get.to(const Profile(), transition: Transition.fadeIn);
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                child: _selectedIndex == 3
                    ? Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        color: defaultColor,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: Row(
                            children: [
                              ImageIcon(
                                  color: Colors.white,
                                  size: 30,
                                  AssetImage("assets/images/profile_icon.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.person_pin,
                          size: 30,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
