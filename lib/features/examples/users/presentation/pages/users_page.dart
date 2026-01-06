import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_starter_kit/core/routing/routes.dart';
import 'package:flutter_starter_kit/core/utils/app_strings.dart';
import 'package:flutter_starter_kit/shared/widgets/empty_state_view.dart';
import 'package:flutter_starter_kit/shared/widgets/error_view.dart';
import 'package:flutter_starter_kit/shared/widgets/list_bottom_loader.dart';
import 'package:flutter_starter_kit/shared/widgets/loading_view.dart';

import '../viewmodels/users_view_model.dart';
import '../widgets/user_card.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  static const double _loadMoreThreshold = 200;

  bool _onScrollNotification(ScrollNotification notification) {
    // Trigger only when user finishes scrolling
    if (notification is ScrollEndNotification) {
      final metrics = notification.metrics;

      final reachedEnd =
          metrics.pixels >= metrics.maxScrollExtent - _loadMoreThreshold;

      if (reachedEnd) {
        final viewModel = context.read<UsersViewModel>();

        if (!viewModel.isLoading && viewModel.hasMore) {
          viewModel.loadMore();
        }
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navUsers)),
      body: Consumer<UsersViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading && viewModel.users.isEmpty) {
            return const LoadingView();
          }

          if (viewModel.errorMessage != null && viewModel.users.isEmpty) {
            return ErrorView(
              message: viewModel.errorMessage ?? AppStrings.genericError,
              onRetry: viewModel.loadInitial,
            );
          }

          if (viewModel.users.isEmpty) {
            return const EmptyStateView();
          }

          return NotificationListener<ScrollNotification>(
            onNotification: _onScrollNotification,
            child: RefreshIndicator(
              onRefresh: viewModel.refresh,
              child: ListView.separated(
                padding: const .symmetric(horizontal: 16, vertical: 12),
                itemCount: viewModel.users.length + (viewModel.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= viewModel.users.length) {
                    return const ListBottomLoader();
                  }

                  final user = viewModel.users[index];
                  return UserCard(
                    user: user,
                    onTap: () => context.push(Routes.userDetails, extra: user),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
