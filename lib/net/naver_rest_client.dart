import 'package:json_annotation/json_annotation.dart';
import 'package:movie_mark/net/naver_movies.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'naver_rest_client.g.dart';

@RestApi(baseUrl: 'https://openapi.naver.com/v1/')
abstract class NaverRestClient {
  factory NaverRestClient(Dio dio, {String baseUrl}) = _NaverRestClient;

  @GET('/search/movie.json')
  Future<NaverMovies> getMovies(
    @Header('X-Naver-Client-Id') String clientId,
    @Header('X-Naver-Client-Secret') String clientSecret,
    @Query('query') String query
  );
}
