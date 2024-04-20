import 'package:flutter/material.dart';

kikuGradient() {
  return const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xFF680179), Color(0xFF8B0075)]));
}

vecStack(double width, double height) {
  return Stack(
    children: [
      Image.asset(
        width: width,
        height: height,
        "assets/images/vector1.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
          width: width,
          height: height,
          "assets/images/vector2.png",
          fit: BoxFit.cover),
      Image.asset(
          width: width,
          height: height,
          "assets/images/vector3.png",
          fit: BoxFit.cover),
    ],
  );
}

featuredDivider(
  double width,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFFC700),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text("Featured Symbols"),
          ),
        ),
        SizedBox(
          width: width * 0.62,
          child: Divider(
            color: defaultColor,
            thickness: 1,
          ),
        ),
      ],
    ),
  );
}

mostPopularDivider(
  double width,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Color(0xFFFFC700),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              "Most Popular",
              style: TextStyle(color: defaultColor),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.64,
          child: const Divider(
            color: Colors.white,
            thickness: 1,
          ),
        ),
      ],
    ),
  );
}

symbolType(String title) {
  return Row(
    children: [
      const SizedBox(
        width: 10,
      ),
      Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        width: 10,
      ),
      const Expanded(
        child: Divider(
          color: Colors.white,
          thickness: 1,
        ),
      ),
      const SizedBox(
        width: 20,
      )
    ],
  );
}

alignBottomAppBar(int selectedIndex) {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          padding: const EdgeInsets.only(bottom: 30.0, left: 8, right: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (i) {
                // setState(() {
                selectedIndex = i;
                // });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: selectedIndex == 0
                        ? const Row(
                            children: [
                              // SizedBox(
                              //   width: 20,
                              // ),
                              ImageIcon(
                                  size: 30,
                                  AssetImage("assets/images/home_icon.png")),
                              SizedBox(
                                width: 1,
                              ),
                              Text("Home")
                            ],
                          )
                        : const ImageIcon(
                            size: 30,
                            AssetImage(
                              "assets/images/home_icon.png",
                            )),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: selectedIndex == 1
                        ? const Card(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  ImageIcon(
                                      // size: 0,
                                      AssetImage(
                                          "assets/images/symbols_icon.png")),
                                  Text("Symbols")
                                ],
                              ),
                            ),
                          )
                        : const ImageIcon(
                            size: 30,
                            AssetImage("assets/images/symbols_icon.png")),
                    label: "Symbols"),
                BottomNavigationBarItem(
                    icon: selectedIndex == 2
                        ? const Row(
                            children: [
                              ImageIcon(
                                  size: 30,
                                  AssetImage(
                                      "assets/images/bookmark_icon.png")),
                              Text("Bookmark")
                            ],
                          )
                        : const ImageIcon(
                            size: 30,
                            AssetImage("assets/images/bookmark_icon.png")),
                    label: "Bookmark"),
                BottomNavigationBarItem(
                    icon: selectedIndex == 3
                        ? const Row(
                            children: [
                              ImageIcon(
                                  size: 30,
                                  AssetImage("assets/images/profile_icon.png")),
                              Text("Profile")
                            ],
                          )
                        : const ImageIcon(
                            size: 30,
                            AssetImage("assets/images/profile_icon.png")),
                    label: "Profile"),
              ],
            ),
          )));
}

TextStyle kAuthTextStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Montserrat-Regular',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: 2.0);

Color defaultColor = const Color(0xFF8B0075);

Color defaultColor2 = const Color(0xFFFFC700);

const content =
    "Supremacy   of God, Omnipotence and Immortality of God. \n\n The Akan phrase \"Gye Nyame\" literally translates to \"Except   God.\" It conveys God's omnipotence and alpha status in all matters.Arguably, the most well-known Adinkra symbol is Gye Nyame. The statement conveys the   profound belief that the Akans hold in the All-Powerful Being, known by   several appellations such as Onyame (Nyame), Onyankopɔn, Twereduampɔn (the   dependable one), and numerous more.God   (Nyame) is almighty, omnipresent, and omniscient in the Akan worldview.";

const content1 =
    "Twereduampɔn (the   dependable one), and numerous more.God   (Nyame) is almighty, omnipresent, and omniscient in the Akan worldview.";

String welcomeText = """
Here you can access all Adrikasymbols in one place. Whether you’re a professional  designer, or simply someone who loves capturing memories, our app has everything you need.""";
