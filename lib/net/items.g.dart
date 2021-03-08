// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    title: json['title'] as String,
    image: json['image'] as String,
    subtitle: json['subtitle'] as String,
    pubDate: json['pubDate'] as String,
    director: json['director'] as String,
    actor: json['actor'] as String,
    userRating: json['userRating'] as String,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'subtitle': instance.subtitle,
      'pubDate': instance.pubDate,
      'director': instance.director,
      'actor': instance.actor,
      'userRating': instance.userRating,
    };
