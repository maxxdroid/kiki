import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiki/screens/mainscreens/profile.dart';
import 'package:kiki/screens/mainscreens/search.dart';

class MySearchAppBar extends StatefulWidget {
  const MySearchAppBar({super.key});

  @override
  State<MySearchAppBar> createState() => _MySearchAppBarState();
}

class _MySearchAppBarState extends State<MySearchAppBar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: width * .5,
                child: const Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 40,
                  )),
              // dropDownButton(),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const Profile(), transition: Transition.fadeIn);
                },
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/user.png"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget dropDownButton() {
    return DropdownButton(
      // value: dropDownValue,
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
}
