import 'package:flutter/material.dart';


class TextfieldWidget extends StatelessWidget {
  final String hitTextName;
  final IconData surfixIcon;
  final TextEditingController controller;
  final bool obscureText;
  const TextfieldWidget({
    super.key,
    required this.hitTextName,
    required this.controller,
    required this.surfixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: const Color(0xFFD9D9D9),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF680179),
            width: 10,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(surfixIcon),
          ),
          hintText: hitTextName,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}