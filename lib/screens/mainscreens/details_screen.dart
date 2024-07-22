import 'package:flutter/material.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/functions/sharedpref.dart';
import 'package:kiki/models/symbol.dart';
import 'package:kiki/widgets/user_appbar.dart';
import 'package:share_it/share_it.dart';


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
  List<Symbols> bookMarkedSymbols = [];
  

  String containerText = "";
  @override
  void initState() {
    containerText = widget.symbol.details;
    _loadBookmarks();
    super.initState();
  }

  Future<void> _loadBookmarks() async {
    bookMarkedSymbols = await SharedPrefHelper().getSymbols();
    setState(() {
      isBookmarked = bookMarkedSymbols.contains(widget.symbol);
    });
  }



  void updateText(String text) {
    setState(() {
      containerText = text;
    });
  }

  void addToBookmarks(Symbols symbols) async {
    setState(() {
      isBookmarked = bookMarkedSymbols.contains(widget.symbol);
      if (!isBookmarked) {
        isBookmarked = true;
        bookMarkedSymbols.add(widget.symbol);
      } else {
        isBookmarked = false;
        bookMarkedSymbols.removeWhere((item) => item.name == widget.symbol.name && item.imgUrl == widget.symbol.imgUrl);
      }
    });
    await SharedPrefHelper().saveSymbols(bookMarkedSymbols);
  }

  void share() {
    final shareText =
        "${widget.symbol.name}, " " ${widget.symbol.aka}'";
    ShareIt.text(
      content: shareText,
      androidSheetTitle: 'Share Kiki',
    );

  }




  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
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
                      width: size*0.5,
                      child: Text(
                        widget.symbol.name,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'capecoast',
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: size * 0.005),
                    SizedBox(
                      width: size*.5,
                      child: Text(
                        "'${widget.symbol.aka}'",
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.amber),
                      ),
                    ),
                    SizedBox(height: size * 0.01),
                    SizedBox(
                      height:height * .15,
                      width: size * .5,
                      child: SingleChildScrollView(
                        child: Text(
                          // textAlign: TextAlign.start,
                          widget.symbol.summary,
                          style:const TextStyle(fontSize: 15, color: Colors.white, overflow: TextOverflow.fade),
                        ),
                      ),
                    ),
                    SizedBox(height: size * 0.02),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addToBookmarks(widget.symbol);
                          },
                          child: Image(
                            image: const AssetImage("assets/images/bookmarks.png"),
                            color: isBookmarked ? Colors.orange : Colors.white,
                            // size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            share();
                          },
                          child: const ImageIcon(
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
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(25)),
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
      ),
    );
  }
}
