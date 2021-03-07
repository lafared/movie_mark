import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_mark/ui/home.dart';
import 'package:movie_mark/ui/intro.dart';

// final materialThemeData = ThemeData(
//   primarySwatch: Colors.blue,
//   scaffoldBackgroundColor: Colors.white,
//   accentColor: Colors.blue,
//   appBarTheme: AppBarTheme(color: Colors.blue),
//   primaryColor: Colors.blue,
//   secondaryHeaderColor: Colors.blue,
//   canvasColor: Colors.blue,
//   backgroundColor: Colors.red,
//   textTheme: TextTheme().copyWith(body1: TextTheme().bodyText1)
// );
//
// final cupertinoThemeData = CupertinoThemeData(
//   primaryColor: Colors.blue,
//   barBackgroundColor: Colors.blue,
//   scaffoldBackgroundColor: Colors.white
// );

class Routes {
  static const String INTRO = 'INTRO';
  static const String HOME = 'HOME';
}

void main() => runApp(MovieMark());

class MovieMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'title : Movie Mark',
    theme: ThemeData(
        primarySwatch: Colors.blue
    ),
    routes: {
      Routes.INTRO : (context) => Intro(),
      Routes.HOME : (context) => Home(),
    },
    initialRoute: Routes.INTRO,
  );
}
