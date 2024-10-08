import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/consts/kikiConstSymbols.dart';
import 'package:kiki/consts/sample_data.dart';
import 'package:kiki/screens/mainscreens/details_screen.dart';
import 'package:kiki/widgets/bottom_navbar.dart';
import 'package:kiki/widgets/user_appbar.dart';
import 'package:kiki/widgets/welcome_text.dart';

class KikiHome extends StatefulWidget {
  const KikiHome({super.key});

  @override
  State<KikiHome> createState() => _KikiHomeState();
}

class _KikiHomeState extends State<KikiHome> {
  final int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height * 0.5,
            decoration: kikuGradient(),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height * 0.08,
                decoration: kikuGradient(),
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyAppBar(),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const WelcomeText(),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 8, right: 8),
                      child: Text(
                        "Most Popular Symbols",
                        style:
                            TextStyle(color: Color(0xFFFFC700), fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: height * 0.22,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularSymbols.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    DetailedScreen(
                                      symbol: popularSymbols[index],
                                    ),
                                    transition: Transition.fadeIn);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, right: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 0,
                                              blurRadius: 10),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                            height: 100,
                                            width: 80,
                                            fit: BoxFit.cover,
                                            popularSymbols[index].imgUrl),
                                      ),
                                    ),
                                    Text(
                                      popularSymbols[index].name,
                                      style: TextStyle(color: defaultColor, fontFamily: 'capecoast',),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    featuredDivider(width),
                    SizedBox(
                      height: height * 0.22,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    DetailedScreen(
                                      symbol: adinkraSymbol[index],
                                    ),
                                    transition: Transition.fadeIn);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, right: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 0,
                                              blurRadius: 10),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                            height: 110,
                                            width: 90,
                                            fit: BoxFit.cover,
                                            adinkraSymbol[index].imgUrl),
                                      ),
                                    ),
                                    Text(
                                      adinkraSymbol[index].name,
                                      style: TextStyle(color: defaultColor,fontFamily: 'capecoast',),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: height * 0.15,
                    )
                  ],
                ),
              ],
            ),
          ),
          MyBottomNavBar(selectedIndex: _selectedIndex),
        ],
      ),
    );
  }
}
