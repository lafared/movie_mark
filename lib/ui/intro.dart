import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Intro();
}

class _Intro extends State<Intro> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
          child: Text('Movie\nMark', style: TextStyle(fontFamily: 'Hey August', fontSize: 45, color: Colors.black),),
        )
      ],
    ),
  );
}