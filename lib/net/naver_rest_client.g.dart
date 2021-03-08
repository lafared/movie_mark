// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NaverRestClient implements NaverRestClient {
  _NaverRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://openapi.naver.com/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<NaverMovies> getMovies(clientId, clientSecret, query) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    ArgumentError.checkNotNull(clientSecret, 'clientSecret');
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/search/movie.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'X-Naver-Client-Id': clientId,
              r'X-Naver-Client-Secret': clientSecret
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NaverMovies.fromJson(_result.data);
    return value;
  }
}
