import 'package:flutter_starter_kit/core/utils/result.dart';

import '../../data/repositories/user_repository.dart';
import '../models/paginated_users.dart';

class GetUsersUseCase {
  const GetUsersUseCase({required UserRepository repository})
      : _repository = repository;

  final UserRepository _repository;

  Future<Result<PaginatedUsers>> call({
    required int page,
    required int results,
  }) {
    return _repository.fetchUsers(page: page, results: results);
  }
}
