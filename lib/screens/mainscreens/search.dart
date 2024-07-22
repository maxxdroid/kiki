import 'package:flutter/material.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/widgets/search_bar.dart';
import 'package:kiki/widgets/user_appbar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                  color: Colors.white
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: width,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
