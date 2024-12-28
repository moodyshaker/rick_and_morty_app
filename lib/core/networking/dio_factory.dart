import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio init() {
    Duration timeout = const Duration(seconds: 3);
    dio ??= Dio()
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..options.headers = {
        'Accept': 'application/json',
      }
      ..interceptors.add(PrettyDioLogger(
          requestBody: true, requestHeader: true, responseHeader: true));
    return dio!;
  }
}
