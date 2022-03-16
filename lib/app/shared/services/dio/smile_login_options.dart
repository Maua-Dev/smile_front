import 'package:dio/dio.dart';

final smileLoginOption = BaseOptions(
    baseUrl:
        'https://b574ab6867.execute-api.sa-east-1.amazonaws.com/dev/smile-mss-cognito',
    connectTimeout: 5000,
    receiveTimeout: 3000);
