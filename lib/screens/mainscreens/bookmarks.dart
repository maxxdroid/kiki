import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/functions/sharedpref.dart';
import 'package:kiki/main.dart';
import 'package:kiki/models/symbol.dart';
import 'package:kiki/widgets/bottom_navbar.dart';
import 'package:kiki/widgets/user_appbar.dart';

import 'details_screen.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> with RouteAware {
  List<Symbols> bookMarkedSymbols = [];

  @override
  void initState() {
    _loadBookmarks();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    bookMarkedSymbols = await SharedPrefHelper().getSymbols();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                          width: width * 0.93,
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
                      style: TextStyle(
                          color: defaultColor2,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                height: height * 0.65,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: bookMarkedSymbols.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          DetailedScreen(symbol: bookMarkedSymbols[index]),
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
                                  bookMarkedSymbols[index].imgUrl,
                                  height: height*0.12,
                                  width: width*0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 25,
                              child: Text(
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                bookMarkedSymbols[index].name,
                                style: const TextStyle(color: Colors.white,fontFamily: 'capecoast',),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
      ),
    );
  }
}
