import 'package:dio/dio.dart';

class BadRequestException extends DioError {
  String? msg;
  BadRequestException({required RequestOptions requestOptions, this.msg})
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return msg ?? "Invalid Request";
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return "Unknown error occured, please try later";
  }
}

class ConflictException extends DioError {
  ConflictException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
  @override
  String toString() {
    return "Conflict Occured";
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
  @override
  String toString() {
    return "Access Denied";
  }
}

class NotFoundExpection extends DioError {
  NotFoundExpection({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
  @override
  String toString() {
    return "The Request information could not be found";
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return "No Internet connection detected, please try again.";
  }
}

class DeadLineExceedException extends DioError {
  DeadLineExceedException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return "Connection Time Out";
  }
}
