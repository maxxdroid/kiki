import 'package:flutter/material.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/widgets/bottom_navbar.dart';
import 'package:kiki/widgets/user_appbar.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: kikuGradient(),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                Container(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, top: 0, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: width*0.93,
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Bookmarks",
                    style: TextStyle(color: defaultColor2, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
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
          const MyBottomNavBar(selectedIndex: 2),
        ],
      ),
    );
  }
}
