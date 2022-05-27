import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import 'exeptions/exceptions.dart';

class ApiClient {
  Dio dio = _init();
  static String baseUrl = "http://mern.online:5008"; //todo change this
  static _init() {
    Dio _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20000, //15 secs
        receiveTimeout: 20000,
        sendTimeout: 20000));
    _dio.interceptors.add(ApiInterceptor());
    return _dio;
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //checking for token
    GetStorage box = GetStorage();
    var token = await box.read("token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer " + token;
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadLineExceedException(requestOptions: err.requestOptions);
      case DioErrorType.response:
        switch (err.response!.statusCode) {
          case 400:
            throw BadRequestException(
                requestOptions: err.requestOptions,
                msg: err.response!.data["error"]);
          case 401:
            throw UnauthorizedException(requestOptions: err.requestOptions);
          case 404:
            throw NotFoundExpection(requestOptions: err.requestOptions);
          case 409:
            throw ConflictException(requestOptions: err.requestOptions);
          case 500:
            throw InternalServerErrorException(
                requestOptions: err.requestOptions);
          case 503:
            throw InternalServerErrorException(
                requestOptions: err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(requestOptions: err.requestOptions);
    }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}
