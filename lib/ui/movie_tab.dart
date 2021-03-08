import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_mark/app_color.dart';
import 'package:movie_mark/app_str.dart';
import 'package:movie_mark/net/items.dart';
import 'package:movie_mark/net/naver_movies.dart';
import 'package:movie_mark/net/naver_rest_client.dart';

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
                visible: (!_searchFocus.hasFocus && _searchTextController.value.text.length == 0),
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
                onSubmitted: (value) {
                  _doSearch();
                },
              ),
            ),
          ],
        )
      ),
      Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            print('search');
            _doSearch();
          },
          child: Image.asset('assets/img/search.png',)
        ),
      ),
    ],
  );

  _doSearch() {
    print('_doSearch text : ${_searchTextController.value.text}');
    final dio = Dio();
    final client = NaverRestClient(dio);
    client.getMovies('NBFCT42oSAetHAofjuzM', 'IwZnrR9vuS', '존윅').then((value) => {
      _printLog(value)
    });
  }

  _printLog(NaverMovies naverMovies) {
    print(naverMovies.lastBuildDate);
    print(naverMovies.total);
    print(naverMovies.start);
    print(naverMovies.display);
    for(int i = 0; i < naverMovies.items.length; i++) {
      print(naverMovies.items[i].title);
      print(naverMovies.items[i].director);
      print(naverMovies.items[i].actor);
      print(naverMovies.items[i].pubDate);
      print(naverMovies.items[i].image);
      print(naverMovies.items[i].subtitle);
      print(naverMovies.items[i].userRating);
    }
  }
}