import 'package:dio/dio.dart';

import '../api_provider/api_client.dart';

class ChatApiClient {
  Dio dio = _init();
  static _init() {
    Dio _dio = Dio(BaseOptions(
        baseUrl:
            ApiClient.baseUrl,
        connectTimeout: 20000, //15 secs
        receiveTimeout: 20000,
        sendTimeout: 20000));
    _dio.interceptors.add(ApiInterceptor());
    return _dio;
  }
}
