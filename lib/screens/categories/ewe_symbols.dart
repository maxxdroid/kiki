import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/consts/ewe.dart';
import 'package:kiki/screens/mainscreens/details_screen.dart';
import 'package:kiki/widgets/user_appbar.dart';

class EweSymbols extends StatefulWidget {
  const EweSymbols({super.key});

  @override
  State<EweSymbols> createState() => _EweSymbolsState();
}

class _EweSymbolsState extends State<EweSymbols> {
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
          child: Column(children: [
            const MyAppBar(),
            const Text(
              "Ewe Symbols",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.85,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns in the grid
                  crossAxisSpacing: 10.0, // Horizontal space between grid items
                  mainAxisSpacing: 0.0, // Vertical space between grid items
                  childAspectRatio: 3 / 4, // Aspect ratio of each grid item
                ),
                itemCount: eweSymbols.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        DetailedScreen(symbol: eweSymbols[index]),
                        transition: Transition.fadeIn,
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.all(5.0), 
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
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                eweSymbols[index].imgUrl,
                                height: height*0.12,
                                width: width*0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            height: 20,
                            child: Text(
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              eweSymbols[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}