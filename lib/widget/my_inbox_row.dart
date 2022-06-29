// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';

class MyInboxRow extends StatelessWidget {
  const MyInboxRow({
    Key? key,
    this.isProfile = true,
    this.image = '',
    required this.textH,
    required this.text,
  }) : super(key: key);

  final bool isProfile;
  final String image, textH, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isProfile
            ? ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image(
                  image: AssetImage('assets/spotlight/$image.png'),
                  width: 210 / 3,
                  height: 210 / 3,
                  fit: BoxFit.contain,
                ),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 210 / 3,
                    height: 210 / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      border: Border.all(
                        color: kRedColor,
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/login/AppLogo.png'),
                    width: 103 / 3,
                    height: 103 / 3,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
        SizedBox(width: 59.3 / 3),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textH,
              style: TextStyle(
                color: Colors.white,
                fontSize: 52 / 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Text(
                text,
                style: TextStyle(
                  color: Color(0xffB7B7B7),
                  fontSize: 36 / 3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
