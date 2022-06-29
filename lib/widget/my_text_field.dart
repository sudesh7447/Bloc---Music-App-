// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.color = kRedColor,
    this.isRequire = true,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final Color color;
  final bool isRequire;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isRequire)
          Text(
            hintText,
            style: kTextStyle.copyWith(fontSize: 50 / 3),
          ),
        SizedBox(height: 27 / 3),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24 / 3),
                color: Colors.black,
                border: Border.all(color: Colors.grey.shade700),
              ),
            ),
            TextFormField(
              style: kTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 50 / 3,
              ),
              decoration: kTextFormFieldAuthDec.copyWith(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 45 / 3,
                ),
                prefixIcon: Icon(icon, color: color),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
