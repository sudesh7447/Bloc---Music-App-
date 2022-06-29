// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_work/bloc/track_bloc.dart';
import 'package:music_app_work/bloc/track_event.dart';
import 'package:music_app_work/bloc/track_state.dart';
import 'package:music_app_work/helpers/constants.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';
import 'package:music_app_work/widget/my_text_field.dart';
import 'package:provider/provider.dart';

import '../data/ListUrl_model.dart';

class MySongScreen extends StatefulWidget {
  const MySongScreen({Key? key}) : super(key: key);

  @override
  State<MySongScreen> createState() => _MySongScreenState();
}

class _MySongScreenState extends State<MySongScreen> {
  late TrackBloc trackBloc;

  @override
  void initState() {
    super.initState();
    trackBloc = BlocProvider.of<TrackBloc>(context);
    trackBloc.add(FetchTrackEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Material(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: kPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'All Songs',
                        style: TextStyle(
                          fontSize: 60 / 3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            trackBloc.add(FetchTrackEvent());
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(height: 66 / 3),
                  MyTextField(
                    hintText: 'Search',
                    isRequire: false,
                    icon: Icons.search_sharp,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(height: 44 / 3),
                  Row(
                    children: [
                      Text(
                        'Songs',
                        style: TextStyle(
                          color: kRedColor,
                          fontSize: 60 / 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' (242)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60 / 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 51 / 3),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                          child: BlocListener<TrackBloc, TrackState>(
                        listener: (context, state) {
                          if (state is TrackErrorState) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.msg),
                              ),
                            );
                          }
                        },
                        child: BlocBuilder<TrackBloc, TrackState>(
                            builder: (context, state) {
                          if (state is TrackLoadedState) {
                            return buildTrackList(state.list);
                          } else if (state is TrackErrorState) {
                            return buildErrorUi(state.msg);
                          } else {
                            return buildLoading();
                          }
                        }),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildTrackList(List<TrackList>? list) {
    return ListView.builder(
      itemCount: list!.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              child: MySongWidget(
                  title: list[pos].track!.trackName.toString(),
                  artistName: list[pos].track!.artistName.toString(),
                  albumName: list[pos].track!.albumName.toString())
              // child: ListTile(
              //   leading: ClipOval(
              //     child: Hero(
              //       tag: list[pos].urlToImage,
              //       child: Image.network(
              //         list[pos].urlToImage,
              //         fit: BoxFit.cover,
              //         height: 70.0,
              //         width: 70.0,
              //       ),
              //     ),
              //   ),
              //   title: Text(list[pos].title),
              //   subtitle: Text(list[pos].publishedAt),
              // ),
              // onTap: () {
              //   navigateToArticleDetailPage(context, articles[pos]);
              // },
              ),
        );
      },
    );
  }

  // void navigateToArticleDetailPage(BuildContext context, Articles article) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return ArticleDetailPage(
  //       article: article,
  //     );
  //   }));
  // }
  //
  // void navigateToAoutPage(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return AboutPage();
  //   }));
  // }
}

class MySongWidget extends StatelessWidget {
  const MySongWidget({
    Key? key,
    required this.title,
    required this.artistName,
    required this.albumName,
  }) : super(key: key);

  final String title, albumName, artistName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: AssetImage('assets/login/AppLogo.png'),
              width: 176 / 3,
              height: 176 / 3,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 56.3 / 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48 / 3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$albumName $artistName',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36 / 3,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 35 / 3),
        Divider(color: Colors.white.withOpacity(0.3)),
      ],
    );
  }
}
// Column(
// children: [
// MySongWidget(
// image: '1',
// sub: 'The calling',
// title: 'Wherever You Will Go',
// time: '3:54',
// ),
// ],
// ),
