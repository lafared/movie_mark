import 'package:flutter/material.dart';
import 'package:movie_mark/app_str.dart';

class MovieMarkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      child: Center(
        child: Text(AppStr.MOVIE_MARK),
      ),
    ),
  );
}