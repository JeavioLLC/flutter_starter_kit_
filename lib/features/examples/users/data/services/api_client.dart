import 'package:flutter_starter_kit/core/utils/result.dart';
import 'package:flutter_starter_kit/shared/services/api/api_config.dart';
import 'package:flutter_starter_kit/shared/services/api/api_handler.dart';

import '../models/user_dto.dart';
import '../../domain/models/paginated_users.dart';

class ApiClient {
  ApiClient({
    required ApiConfig apiConfig,
    ApiHandler? handler,
    Future<void> Function()? onUnauthorized,
  }) : _apiConfig = apiConfig,
       _handler = handler ?? ApiHandler(onUnauthorized: onUnauthorized);

  final ApiConfig _apiConfig;
  final ApiHandler _handler;

  Future<Result<PaginatedUsers>> fetchUsers({
    required int page,
    required int results,
  }) async {
    if (!_apiConfig.isValid) {
      return Result.error('API configuration is missing.');
    }

    final path = '${_apiConfig.baseUrl}/api/?results=$results&page=$page';

    return _handler.handle<PaginatedUsers>(
      path: path,
      method: 'GET',
      operationName: 'fetchUsers',
      onSuccess: (data) {
        final results = data['results'] as List<dynamic>?;
        final info = data['info'] as Map<String, dynamic>?;

        if (results == null || info == null) {
          throw const FormatException('Unexpected JSON format');
        }

        final users = results
            .map((item) {
              return UserDto.fromJson(Map<String, dynamic>.from(item as Map));
            })
            .map((dto) => dto.toDomain())
            .toList();

        final int currentPage = info['page'] as int;
        final int resultCount = info['results'] as int;
        final bool hasNext = users.length == resultCount;

        return PaginatedUsers(
          users: users,
          page: currentPage,
          results: resultCount,
          hasNext: hasNext,
          nextPage: hasNext ? currentPage + 1 : null,
        );
      },
    );
  }
}
