import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? url = dotenv.env['MSS_ACTIVITIES_BASE_URL'];

final smileOption =
    BaseOptions(baseUrl: url!, connectTimeout: 5000, receiveTimeout: 3000);
