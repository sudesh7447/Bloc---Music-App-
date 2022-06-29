// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';

import 'package:music_app_work/widget/my_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    Size size = MediaQuery.of(context).size;

    String description =
        'Singers read, memorize, and perform music to live audiences or in the studio. They may receive formal education and training, or rely purely on raw talent and hard work. ';

    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 1042 / 3,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/room/a3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: kPadding.copyWith(top: size.height * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_outlined, color: Colors.white),
                          Text(
                            'Profile',
                            style: kTextStyle.copyWith(
                              fontSize: 60 / 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image(
                            image: AssetImage(
                              'assets/room/EDIT.png',
                            ),
                            width: 49 / 3,
                            height: 49 / 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 163 / 3),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff707070)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: AssetImage('assets/room/a3.png'),
                          width: 374 / 3,
                          height: 380 / 3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.5 / 3),
                    Text(
                      'Alexa Doe',
                      style: kTextStyle.copyWith(
                        fontSize: 60 / 3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Musician',
                        style: kTextStyle.copyWith(fontSize: 40 / 3)),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50 / 3)
                    .copyWith(top: 93 / 3),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButton2(
                            color: kRedColor,
                            text: 'Follow',
                            icon: 'follower',
                          ),
                          MyButton2(
                            color: Colors.transparent,
                            isBorder: true,
                            text: 'Message',
                            icon: 'message',
                          ),
                        ],
                      ),
                      SizedBox(height: 99 / 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyRow(text: 'My Songs', number: '242'),
                          MyRow(text: 'Followers', number: '549'),
                          MyRow(text: 'Followings', number: '112'),
                        ],
                      ),
                      SizedBox(height: 93.7 / 3),
                      Text(
                        'About',
                        style: TextStyle(
                          color: kRedColor,
                          fontSize: 60 / 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40 / 3,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(text: description),
                            TextSpan(
                              text: "Read More...",
                              style: TextStyle(
                                color: kRedColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 87.4 / 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 55 / 3),
                        child: MyButton(text: 'Save'),
                      ),
                      SizedBox(height: 87.4 / 3),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  final String number, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            color: kRedColor,
            fontSize: 60 / 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 9 / 3),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50 / 3,
          ),
        ),
      ],
    );
  }
}
