// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_work/bloc/track_bloc.dart';
import 'package:music_app_work/bloc/track_state.dart';
import 'package:music_app_work/data/repo/list_song_repo.dart';
import 'package:music_app_work/provider/bottom_nav_provider.dart';

import 'package:music_app_work/screen/my_song_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
      home: BlocProvider(
        create: (BuildContext context) =>
            TrackBloc(TrackInitialState(), TrackRepositoryImpl()),
        child: MySongScreen(),
      ),
    );
  }
}
