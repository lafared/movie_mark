import 'package:flutter/material.dart';
import 'package:movie_mark/app_color.dart';
import 'package:movie_mark/app_str.dart';

class MovieTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MovieTab();
}

class _MovieTab extends State<MovieTab> {
  TextEditingController _searchTextController;
  TextEditingController _testTextController;
  FocusNode _searchFocus;

  @override
  void initState() {
    super.initState();
    _searchTextController = new TextEditingController();
    _testTextController = new TextEditingController();
    _searchTextController.addListener(() {
      print('listner : ${_searchTextController.text}');
    });
    _searchFocus = new FocusNode();
    _searchFocus.addListener(() {
      print('focus : ${_searchFocus.hasFocus}');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: _body(context)
  );

  Widget _body(BuildContext context) => Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: [
        _topLayout(),
        Container(
          height: 1,
          color: AppColor().mainColor,
        ),
        Text(AppStr.MOVIES),
        TextField(
          controller: _testTextController,
          decoration: InputDecoration(labelText: AppStr.SEARCH_HINT,),
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );

  Widget _topLayout() => Row(
    children: [
      Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(15),
        child: Image.asset('assets/img/hamburger.png',)
      ),
      Container(
        width: 1,
        height: 50,
        color: AppColor().mainColor,
      ),
      Expanded(
        child: Stack(
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Visibility(
                visible: !_searchFocus.hasFocus,
                child: Text(AppStr.SEARCH_HINT, style: TextStyle(fontSize: 15, color: Colors.black45),)
              )
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              child: TextField(
                controller: _searchTextController,
                decoration: null,
                style: TextStyle(fontSize: 25),
                cursorColor: AppColor().lightColor,
                focusNode: _searchFocus,
              ),
            ),
          ],
        )
      ),
      Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(10),
        child: Image.asset('assets/img/search.png',)
      ),
    ],
  );
}