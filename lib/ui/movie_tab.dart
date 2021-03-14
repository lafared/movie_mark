import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_mark/app_color.dart';
import 'package:movie_mark/app_str.dart';
import 'package:movie_mark/net/naver_movies.dart';
import 'package:movie_mark/net/naver_rest_client.dart';
import 'package:movie_mark/ui/movie_list_view.dart';

class MovieTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MovieTab();
}

class _MovieTab extends State<MovieTab> {
  TextEditingController _searchTextController;
  FocusNode _searchFocus;
  NaverMovies naverMovies;

  @override
  void initState() {
    super.initState();
    _searchTextController = new TextEditingController();
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
        MovieListView(naverMovies: naverMovies)
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
    client.getMovies('NBFCT42oSAetHAofjuzM', 'IwZnrR9vuS', _searchTextController.value.text)
        .then((value) => {_loadData(value)});
  }

  _loadData(NaverMovies movies) {
    setState(() {
      naverMovies = movies;
    });

    print(movies.lastBuildDate);
    print(movies.total);
    print(movies.start);
    print(movies.display);
    for(int i = 0; i < movies.items.length; i++) {
      print(movies.items[i].title);
      print(movies.items[i].director);
      print(movies.items[i].actor);
      print(movies.items[i].pubDate);
      print(movies.items[i].image);
      print(movies.items[i].subtitle);
      print(movies.items[i].userRating);
    }
  }
}