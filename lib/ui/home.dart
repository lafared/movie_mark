import 'package:flutter/material.dart';
import 'package:movie_mark/app_str.dart';
import 'package:movie_mark/main.dart';
import 'package:movie_mark/ui/movie_mark_tab.dart';
import 'package:movie_mark/ui/movie_tab.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

const double TAB_HEIGHT = 60;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: _body(),
    bottomNavigationBar: _bottomNavigationBar(),
  );

  Widget _body() => TabBarView(
    children: [MovieTab(), MovieMarkTab()],
    controller: _tabController,
  );

  Widget _bottomNavigationBar() => Stack(
    children: [
      Container(
        height: TAB_HEIGHT,
        color: Colors.deepOrange[400],
      ),
      TabBar(
        indicatorWeight: 0,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Container(
            alignment: Alignment.center,
            height: TAB_HEIGHT,
            child: Tab(child: Text(AppStr.MOVIES, style: TextStyle(fontFamily: 'aAbsoluteEmpire', fontSize: 20, color: Colors.white),),)
          ),
          Container(
            alignment: Alignment.center,
            height: TAB_HEIGHT,
            child: Tab(child: Text(AppStr.MOVIE_MARK, style: TextStyle(fontFamily: 'aAbsoluteEmpire', fontSize: 20, color: Colors.white),),)
          ),
        ],
        controller: _tabController,
        indicator: DotIndicator(
          color: Colors.black,
          distanceFromCenter: 15,
          radius: 3,
          paintingStyle: PaintingStyle.fill
        ),
      )
    ],
  );
}