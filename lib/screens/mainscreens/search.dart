import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiki/consts/GaCosntsSymbols.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/consts/ewe.dart';
import 'package:kiki/consts/kikiConstSymbols.dart';
import 'package:kiki/models/symbol.dart';
import 'package:kiki/screens/mainscreens/details_screen.dart';
import 'package:kiki/widgets/search_bar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<Symbols> filterSymbols = [];
  List<Symbols> allSymbols = [];

  @override
  void initState() {
    allSymbols.addAll(eweSymbols);
    allSymbols.addAll(getGaSymbols);
    searchController.addListener(filterAllSymbols);
    filterSymbols = allSymbols;
    super.initState();
  }

  void filterAllSymbols() {
    List<Symbols> results = [];
    if (searchController.text.isEmpty) {
      results = adinkraSymbol;
    } else {
      results = allSymbols
          .where((symbol) => symbol.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }

    setState(() {
      filterSymbols = results;
    });
  }

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
            children: [
              const MySearchAppBar(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: width,
                height: 50,
                child: TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height * .8,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid
                    crossAxisSpacing:
                        10.0, // Horizontal space between grid items
                    mainAxisSpacing: 10.0, // Vertical space between grid items
                    childAspectRatio: 3 / 4, // Aspect ratio of each grid item
                  ),
                  itemCount: filterSymbols.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          DetailedScreen(symbol: filterSymbols[index]),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(
                            5.0), // Adjust padding if needed
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
                                  filterSymbols[index].imgUrl,
                                  height: height * 0.12,
                                  width: width * 0.2,
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
                                filterSymbols[index].name,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
