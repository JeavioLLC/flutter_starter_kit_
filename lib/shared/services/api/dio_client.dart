import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'prod');
final bool isDev = flavor == 'dev';

class DioClient {
  DioClient(this._dio, {this.onUnauthorized}) {
    _dio.interceptors.addAll([
      AuthInterceptor(onUnauthorized),
      if (isDev)
        LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }

  final Dio _dio;
  final Future<void> Function()? onUnauthorized;

  Dio get dio => _dio;
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.onUnauthorized);

  final Future<void> Function()? onUnauthorized;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer \$token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      onUnauthorized?.call();
    }
    handler.next(err);
  }
}

/*class LoggingInterceptor extends Interceptor {
  final _logger = Logger('Dio');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.info('--> \${options.method} \${options.path}');
    _logger.fine('Headers: \${options.headers}');
    _logger.fine('Data: \${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.info('<-- \${response.statusCode} \${response.requestOptions.path}');
    _logger.fine('Response: \${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.severe('<-- \${err.response?.statusCode} \${err.requestOptions.path}');
    _logger.severe(err.error);
    handler.next(err);
  }
}*/
