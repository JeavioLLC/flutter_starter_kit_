
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_starter_kit/core/utils/result.dart';
import 'package:flutter_starter_kit/features/examples/users/data/repositories/user_repository.dart';
import 'package:flutter_starter_kit/features/examples/users/domain/models/paginated_users.dart';
import 'package:flutter_starter_kit/features/examples/users/domain/models/user.dart';
import 'package:flutter_starter_kit/features/examples/users/domain/use_cases/get_users_use_case.dart';

class _MockUserRepository extends Mock implements UserRepository {}

void main() {
  late _MockUserRepository repository;
  late GetUsersUseCase useCase;

  setUp(() {
    repository = _MockUserRepository();
    useCase = GetUsersUseCase(repository: repository);
  });

  test('returns paginated users on success', () async {
    when(() => repository.fetchUsers(page: 1, results: 5)).thenAnswer(
      (_) async => Result.success(
        const PaginatedUsers(
          users: [
            User(
              id: '1',
              firstName: 'Test',
              lastName: 'User',
              email: 'test.user@example.com',
              phone: '123-456-7890',
              largeAvatarUrl: '',
              country: 'Nowhereland',
            ),
          ],
          page: 1,
          results: 1,
          hasNext: false,
        ),
      ),
    );

    final result = await useCase(page: 1, results: 5);

    expect(result.status, Status.success);
    expect(result.data, isNotNull);
    expect(result.data!.users, isNotEmpty);
  });

  test('returns error on failure', () async {
    when(
      () => repository.fetchUsers(page: 1, results: 5),
    ).thenAnswer((_) async => Result.error('oops'));

    final result = await useCase(page: 1, results: 5);

    expect(result.status, Status.error);
    expect(result.message, 'oops');
  });
}
