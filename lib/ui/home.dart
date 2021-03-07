import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: _body(),
  );

  Widget _body() => Container(
    alignment: Alignment.center,
    child: Text('home'),
  );
}