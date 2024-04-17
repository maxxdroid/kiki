import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiki/screens/profile.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                height: 40,
                // width: 10,
                "assets/images/kiki.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                height: 30,
                // width: 10,
                "assets/images/search.png",
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
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
                onTap: (){
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
        DropdownMenuItem(child: Icon(Icons.home),),
      ],
    );
  }
}
