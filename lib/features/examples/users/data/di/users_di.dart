import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../../../shared/services/api/api_config.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../services/api_client.dart';
import '../../domain/use_cases/get_users_use_case.dart';
import '../../presentation/viewmodels/users_view_model.dart';

/// Registers users feature dependencies.
/// This function should be called from main.dart to opt into the users feature.
///
/// Requires [ApiConfig] to be registered in core dependencies.
List<SingleChildWidget> registerUsersFeature() {
  return [
    // Repository
    Provider<UserRepository>(
      create: (context) => UserRepositoryImpl(
        client: ApiClient(apiConfig: context.read<ApiConfig>()),
      ),
    ),
    // Use Case
    Provider<GetUsersUseCase>(
      lazy: true,
      create: (context) =>
          GetUsersUseCase(repository: context.read<UserRepository>()),
    ),
    // ViewModel
    ChangeNotifierProvider(
      create: (context) =>
          UsersViewModel(getUsersUseCase: context.read<GetUsersUseCase>())
            ..loadInitial(),
    ),
  ];
}
