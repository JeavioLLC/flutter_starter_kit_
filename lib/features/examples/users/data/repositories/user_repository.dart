import 'package:flutter_starter_kit/core/utils/result.dart';

import '../../domain/models/paginated_users.dart';

abstract class UserRepository {
  Future<Result<PaginatedUsers>> fetchUsers({
    required int page,
    required int results,
  });
}
