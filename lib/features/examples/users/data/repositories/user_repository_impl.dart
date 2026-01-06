import 'package:flutter_starter_kit/core/utils/result.dart';

import '../../domain/models/paginated_users.dart';
import '../services/api_client.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required ApiClient client,
    this.useOfflineData = true,
  }) : _client = client;

  final ApiClient _client;
  final bool useOfflineData;

  @override
  Future<Result<PaginatedUsers>> fetchUsers({
    required int page,
    required int results,
  }) {
    return _client.fetchUsers(page: page, results: results);
  }
}
