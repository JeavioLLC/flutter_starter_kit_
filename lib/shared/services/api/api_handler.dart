import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_starter_kit/shared/services/api/dio_client.dart';
import 'package:logging/logging.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/result.dart';

typedef FutureVoidCallback = Future<void> Function();

class ApiHandler {
  ApiHandler({Dio? dio, this.onUnauthorized}) : _dio = DioClient(dio ?? Dio(), onUnauthorized: onUnauthorized).dio;

  final Dio _dio;
  final FutureVoidCallback? onUnauthorized;
  final _logger = Logger('ApiHandler');

  Future<Result<T>> handle<T>({
    required String path,
    required String method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required T Function(dynamic data) onSuccess,
    String? operationName,
  }) async {
    final logPrefix = operationName != null ? '[$operationName]' : '';

    try {
      final response = await _dio.request(
        path,
        data: body,
        options: Options(method: method, headers: headers),
      );

      _logger.fine('$logPrefix status: ${response.statusCode}');

      return Result.success(onSuccess(response.data));
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        return Result.error(AppStrings.requestTimedOutError);
      }
      if (error.type == DioExceptionType.connectionError) {
        return Result.error(AppStrings.networkError);
      }
      _logger.severe('$logPrefix request failed', error);
      return Result.error(AppStrings.genericError);
    }
  }
}
