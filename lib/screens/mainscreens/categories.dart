import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/consts/sample_data.dart';
import 'package:kiki/screens/categories/adinkraCategories.dart';
import 'package:kiki/screens/categories/ga_symbols.dart';
import 'package:kiki/widgets/bottom_navbar.dart';
import 'package:kiki/widgets/user_appbar.dart';

class KikiCategories extends StatefulWidget {
  const KikiCategories({super.key});

  @override
  State<KikiCategories> createState() => _CategoryState();
}

class _CategoryState extends State<KikiCategories> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height * 0.7,
            decoration: kikuGradient(),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const MyAppBar(),
                const Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  width: width * 0.5,
                  child: const Divider(
                    color: Colors.white,
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                            const AdinkraCategories(),
                            transition: Transition.fadeIn,
                          );
                        },
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                    "assets/images/adinkra-medium.png"),
                              ),
                            ),
                            const Text(
                              "Adinkra",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                    "assets/images/ewe-dzesi-medium.png"),
                              ),
                            ),
                            const Text(
                              "Ewe Dzesi",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            const GaSymbols(),
                            transition: Transition.fadeIn,
                          );
                        },
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                    "assets/images/ga-samai-medium.png"),
                              ),
                            ),
                            const Text(
                              "Ga Samai",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.12,
                ),
                mostPopularDivider(width),
                SizedBox(
                  height: height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: symbolList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(symbolList[index].imgUrl),
                            Text(
                              symbolList[index].name,
                              style: TextStyle(color: defaultColor),
                            )
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
          const MyBottomNavBar(selectedIndex: 1),
        ],
      ),
    );
  }
}
