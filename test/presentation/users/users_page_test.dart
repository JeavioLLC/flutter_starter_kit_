
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:flutter_starter_kit/core/utils/result.dart';
import 'package:flutter_starter_kit/features/examples/users/data/repositories/user_repository.dart';
import 'package:flutter_starter_kit/features/examples/users/domain/models/paginated_users.dart';
import 'package:flutter_starter_kit/features/examples/users/domain/models/user.dart';
import 'package:flutter_starter_kit/features/examples/users/domain/use_cases/get_users_use_case.dart';
import 'package:flutter_starter_kit/features/examples/users/presentation/pages/users_page.dart';
import 'package:flutter_starter_kit/features/examples/users/presentation/viewmodels/users_view_model.dart';

class _FakeUserRepository implements UserRepository {
  @override
  Future<Result<PaginatedUsers>> fetchUsers({
    required int page,
    int results = 10,
  }) async {
    return Result.success(
      const PaginatedUsers(
        users: [
          User(
            id: '1',
            firstName: 'John',
            lastName: 'Doe',
            email: 'john.doe@example.com',
            phone: '555-555-5555',
            largeAvatarUrl: '',
            country: 'USA',
          ),
        ],
        page: 1,
        results: 1,
        hasNext: false,
      ),
    );
  }
}

void main() {
  testWidgets('renders users returned by the view model', (tester) async {
    final useCase = GetUsersUseCase(repository: _FakeUserRepository());
    final viewModel = UsersViewModel(getUsersUseCase: useCase);
    await viewModel.loadInitial();

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: viewModel,
          child: const UsersPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
  });
}
