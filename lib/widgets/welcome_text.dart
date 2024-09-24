import 'package:flutter/material.dart';
import 'package:kiki/consts/const_widgets.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Welcome to Kiki",
                style: TextStyle(color: Color(0xFFFFC700)),
              ),
              Text(
                ", The ultimate symbols library!",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            welcomeText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
