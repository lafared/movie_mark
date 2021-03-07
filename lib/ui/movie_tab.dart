import 'package:flutter/material.dart';
import 'package:movie_mark/app_str.dart';

class MovieTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      child: Center(
        child: Text(AppStr.MOVIES),
      ),
    ),
  );
}