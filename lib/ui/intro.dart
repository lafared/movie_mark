import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_mark/app_str.dart';
import 'package:movie_mark/main.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Intro();
}

class _Intro extends State<Intro> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    body: _body(),
  );

  Widget _body() => Container(
    color: Colors.white,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 550,
            height: 350,
            child: Lottie.asset(
                'assets/lottie/lottie_book.json',
                repeat: true,
                animate: true
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 70),
          alignment: Alignment.center,
          child: Text(AppStr.MOVIE__MARK, style: TextStyle(fontFamily: 'Hey August', fontSize: 45, color: Colors.black),),
        )
      ],
    ),
  );

  Future<Timer> startTimer() async => Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed(Routes.HOME)
  );
}