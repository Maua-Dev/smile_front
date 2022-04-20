import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = '';

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = dioError.response != null
            ? _handleError(dioError.response!.statusCode!)!
            : 'URL response error';
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return '400: Bad request';
      case 404:
        return '404: Not Found';
      case 500:
        return '500: Internal server error';
      case null:
        return 'Oops something went wrong';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
