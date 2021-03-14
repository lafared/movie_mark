import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_mark/app_color.dart';
import 'package:movie_mark/net/naver_movies.dart';

class MovieListView extends StatelessWidget {
  final NaverMovies naverMovies;
  MovieListView({Key key, this.naverMovies});

  @override
  Widget build(BuildContext context) => Expanded(
    child: ListView.separated(
      itemCount: _getMovieListItemCnt(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, idx) => Container(
        child: Stack(
          children: [
            _getMovieImg(idx)
          ],
        ),
      ),
      separatorBuilder: (context, idx) => Divider(color: AppColor().mainColor,),
    )
  );

  _getMovieListItemCnt() {
    if (naverMovies == null) {
      return 0;
    } else {
      return naverMovies.items.length;
    }
  }

  _getMovieImg(int idx) {
    if (naverMovies.items[idx].image != null && naverMovies.items[idx].image != '') {
      return CachedNetworkImage(
        width: 100,
        height: 100,
        fit: BoxFit.contain,
        imageUrl: naverMovies.items[idx].image,
        placeholder: (context, url) => Lottie.asset(
            'assets/lottie/lottie_book.json',
            repeat: true,
            animate: true
        ),
      );
    } else {
      return Container(
        width: 100,
        height: 100,
        child: Lottie.asset(
            'assets/lottie/lottie_book.json',
            repeat: true,
            animate: true
        ),
      );
    }
  }
}