import 'package:json_annotation/json_annotation.dart';
import 'package:movie_mark/net/items.dart';

part 'naver_movies.g.dart';

@JsonSerializable()
class NaverMovies {
  String lastBuildDate;
  int total;
  int start;
  int display;
  List<Items> items;

  NaverMovies({this.lastBuildDate, this.total, this.start, this.display, this.items});

  factory NaverMovies.fromJson(Map<String, dynamic> json) => _$NaverMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$NaverMoviesToJson(this);
}
