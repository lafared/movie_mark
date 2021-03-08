import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  String title;
  String image;
  String subtitle;
  String pubDate;
  String director;
  String actor;
  String userRating;

  Items({this.title, this.image, this.subtitle, this.pubDate, this.director, this.actor, this.userRating});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
