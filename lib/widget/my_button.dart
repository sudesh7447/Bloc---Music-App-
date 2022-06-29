// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 144 / 3,
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(24 / 3),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 55 / 3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  const MyButton2({
    Key? key,
    required this.color,
    this.isBorder = false,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Color color;
  final bool isBorder;
  final String text, icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      height: 132 / 3,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(66 / 3),
        border: isBorder ? Border.all(color: Colors.grey.shade600) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/room/$icon.png'),
            width: 51 / 3,
            height: 47 / 3,
          ),
          SizedBox(width: 41 / 3),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45 / 3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
