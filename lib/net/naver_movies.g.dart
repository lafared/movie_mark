// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NaverMovies _$NaverMoviesFromJson(Map<String, dynamic> json) {
  return NaverMovies(
    lastBuildDate: json['lastBuildDate'] as String,
    total: json['total'] as int,
    start: json['start'] as int,
    display: json['display'] as int,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NaverMoviesToJson(NaverMovies instance) =>
    <String, dynamic>{
      'lastBuildDate': instance.lastBuildDate,
      'total': instance.total,
      'start': instance.start,
      'display': instance.display,
      'items': instance.items,
    };
