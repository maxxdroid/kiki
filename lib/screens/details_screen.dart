import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/models/symbol.dart';
import 'package:kiki/widgets/user_appbar.dart';

class DetailedScreen extends StatefulWidget {
  final Symbols symbol;
  const DetailedScreen({super.key, required this.symbol});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  bool isDetailButtonClicked = true;
  bool isUsageButtonClicked = false;
  bool isBookmarked = false;

  String containerText = "";
  @override
  void initState() {
    containerText = widget.symbol.details;
    super.initState();
  }

  void updateText(String text) {
    setState(() {
      containerText = text;
    });
  }

  void addToBookmarks() {
    setState(() {
      if (!isBookmarked) {
        isBookmarked = true;
      } else {
        isBookmarked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: kikuGradient,
      body: Container(
        decoration: kikuGradient(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // SizedBox(height: size * 0.25),
          const MyAppBar(),
          symbolType(widget.symbol.category),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                  radius: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(widget.symbol.imgUrl),
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.symbol.name,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: size * 0.005),
                  const Text(
                    "\"Except God\"",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.amber),
                  ),
                  SizedBox(height: size * 0.01),
                  SizedBox(
                    width: size * .4,
                    child: const Text(
                      textAlign: TextAlign.start,
                      "It expresses the omnipotence \n and supremacy of God \n in all affairs.",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: size * 0.02),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          addToBookmarks();
                        },
                        child: Image(
                          image: AssetImage("assets/images/bookmarks.png"),
                          color: isBookmarked ? Colors.orange : Colors.white,
                          // size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ImageIcon(
                            color: Colors.white,
                            size: 30,
                            AssetImage("assets/images/share.png")),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: size * 0.02),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            // margin: const EdgeInsets.symmetric(horizontal: 0),
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 180,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isDetailButtonClicked = true;
                        isUsageButtonClicked = false;
                        updateText(widget.symbol.usage);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.pressed) ||
                            isDetailButtonClicked) {
                          return Colors
                              .white; // Change the color when pressed or clicked
                        }
                        return Colors.amber; // Default color
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity,
                            50.0), // Set the height of the button here
                      ),
                    ),
                    child: const Text(
                      'Detail',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isUsageButtonClicked = true;
                        isDetailButtonClicked = false;
                        updateText(widget.symbol.details);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.pressed) ||
                            isUsageButtonClicked) {
                          return Colors
                              .white; // Change the color when pressed or clicked
                        }
                        return Colors.amber; // Default color
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity,
                            50.0), // Set the height of the button here
                      ),
                    ),
                    child: const Text(
                      'Usage',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(25)),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    textAlign: TextAlign.start,
                    containerText,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
