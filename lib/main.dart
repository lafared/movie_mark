import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_mark/ui/home.dart';
import 'package:movie_mark/ui/intro.dart';
import 'package:movie_mark/ui/movie_tab.dart';

class Routes {
  static const String INTRO = 'INTRO';
  static const String HOME = 'HOME';
  static const String MOVIE = 'MOVIE';  //tmp
}

void main() => runApp(MovieMark());

class MovieMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.blue
    ),
    routes: {
      Routes.INTRO : (context) => Intro(),
      Routes.HOME : (context) => Home(),
      Routes.MOVIE : (context) => MovieTab(),
      // MovieTab()
    },
    initialRoute: Routes.INTRO,
  );
}
