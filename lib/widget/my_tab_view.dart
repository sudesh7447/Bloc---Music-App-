// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';

var kLocalTextStyle = TextStyle(
  color: Colors.white.withOpacity(0.5),
  fontSize: 54 / 3,
  fontWeight: FontWeight.w600,
);

class MyTabView extends StatefulWidget {
  const MyTabView({Key? key}) : super(key: key);

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _index = 0;
            });
          },
          child: Text(
            'All',
            style: kLocalTextStyle.copyWith(color: kRedColor),
          ),
        ),
        SizedBox(width: 113 / 3),
        InkWell(
            onTap: () {
              setState(() {
                _index = 1;
              });
            },
            child: Text('Songs', style: kLocalTextStyle)),
        SizedBox(width: 113 / 3),
        InkWell(
            onTap: () {
              setState(() {
                _index = 0;
              });
            },
            child: Text('Videos', style: kLocalTextStyle)),
        SizedBox(width: 113 / 3),
        InkWell(
            onTap: () {
              setState(() {
                _index = 0;
              });
            },
            child: Text('Artist', style: kLocalTextStyle)),
        SizedBox(width: 113 / 3),
        InkWell(
            onTap: () {
              setState(() {
                _index = 0;
              });
            },
            child: Text('Album', style: kLocalTextStyle)),
      ],
    );
  }
}
