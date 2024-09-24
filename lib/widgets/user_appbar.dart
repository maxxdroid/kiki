// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hold_on_pop/hold_on_pop.dart';
// import 'package:kiki/screens/mainscreens/profile.dart';
// import 'package:kiki/screens/mainscreens/search.dart';
//
// class MyAppBar extends StatefulWidget {
//   const MyAppBar({super.key});
//
//   @override
//   State<MyAppBar> createState() => _MyAppBarState();
// }
//
// class _MyAppBarState extends State<MyAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(
//                 height: 40,
//                 // width: 10,
//                 "assets/images/kiki.png",
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(()=> const Search());
//                 },
//                 child: Image.asset(
//                   height: 30,
//                   // width: 10,
//                   "assets/images/search.png",
//                   fit: BoxFit.cover,
//                   alignment: Alignment.bottomCenter,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {
//                     print("titus");
//                     PopupMenuButton(
//                       icon: const Icon(
//                         Icons.password,
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                       itemBuilder: (ctx) => [
//                         _buildPopupMenuItem('Search', Icons.search),
//                         _buildPopupMenuItem('Upload', Icons.upload),
//                         _buildPopupMenuItem('Copy', Icons.copy),
//                         _buildPopupMenuItem('Exit', Icons.exit_to_app),
//                       ],
//                     );
//                   },
//                   // icon: const Icon(
//                   //   Icons.password,
//                   //   color: Colors.white,
//                   //   size: 40,
//                   // )),
//               // dropDownButton(),
//               const SizedBox(
//                 width: 10,
//               ),
//               GestureDetector(
//                 onTap: (){
//                   Get.to(const Profile(), transition: Transition.fadeIn);
//                 },
//                 child: CircleAvatar(
//                   radius: 20,
//                   child: Image.asset("assets/images/user.png"),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget dropDownButton() {
//     return DropdownButton(
//       // value: dropDownValue,
//       icon: const Icon(Icons.menu),
//       onChanged: (val) {
//         setState(() {
//           // dropDownValue = val!;
//         });
//       },
//       items: const [
//         DropdownMenuItem(child: Icon(Icons.home),),
//       ],
//     );
//   }
// }
//
// PopupMenuItem _buildPopupMenuItem(
//     String title, IconData iconData) {
//   return PopupMenuItem(
//     child: Row(
//       children: [
//         Icon(iconData, color: Colors.black,),
//         Text(title),
//       ],
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hold_on_pop/hold_on_pop.dart';
import 'package:kiki/screens/mainscreens/kiki_home.dart';
import 'package:kiki/screens/mainscreens/profile.dart';
import 'package:kiki/screens/mainscreens/search.dart';

import '../screens/mainscreens/bookmarks.dart';
import '../screens/mainscreens/categories.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  int _popupMenuItemIndex = 0;
  // Color _changeColorAccordingToMenuItem = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  height: 40,
                  "assets/images/kiki.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Search());
                  },
                  child: Image.asset(
                    height: 45,
                    "assets/images/search.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const Profile(), transition: Transition.fadeIn);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.asset("assets/images/user.png"),
                  ),
                ),
                PopupMenuButton<int>(
                  onSelected: (value) {
                    _onMenuItemSelected(value);
                  },
                  icon: const Icon(
                    Icons.more_vert_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                  itemBuilder: (ctx) => [
                    _buildPopupMenuItem('  Home', Icons.home, Options.home.index),
                    _buildPopupMenuItem('  Symbols', Icons.cabin_sharp, Options.symbol.index),
                    _buildPopupMenuItem('  Bookmark', Icons.bookmark_added_sharp, Options.bookmark.index),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dropDownButton() {
    return DropdownButton(
      icon: const Icon(Icons.menu),
      onChanged: (val) {
        setState(() {
          // dropDownValue = val!;
        });
      },
      items: const [
        DropdownMenuItem(
          child: Icon(Icons.home),
        ),
      ],
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        children: [
          Icon(iconData, color: Colors.black),
          Text(title),
        ],
      ),
    );
  }

  void _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == Options.home.index) {
     Get.to(const KikiHome());
    } else if (value == Options.symbol.index) {
      Get.to(const KikiCategories());
    } else if (value == Options.bookmark.index) {
      Get.to(const Bookmarks());
    } else {
      print("four");
    }
  }
}

enum Options { home, symbol, bookmark }
