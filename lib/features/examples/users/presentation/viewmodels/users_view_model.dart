import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/utils/result.dart';

import '../../domain/models/user.dart';
import '../../domain/use_cases/get_users_use_case.dart';

class UsersViewModel extends ChangeNotifier {
  UsersViewModel({required GetUsersUseCase getUsersUseCase})
      : _getUsersUseCase = getUsersUseCase;

  final GetUsersUseCase _getUsersUseCase;
  final List<User> _users = [];
  final Set<String> _userIds = {};

  List<User> get users => List.unmodifiable(_users);
  bool _hasMore = true;
  bool _isLoading = false;
  String? _errorMessage;
  int _page = 1;
  final int _results = 20;

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadInitial() async {
    _page = 1;
    _hasMore = true;
    _users.clear();
    _userIds.clear();
    _errorMessage = null;
    await _fetchUsers();
  }

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore) return;
    await _fetchUsers();
  }

  Future<void> refresh() async {
    await loadInitial();
  }

  Future<void> _fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await _getUsersUseCase(page: _page, results: _results);

    if (result.status == Status.success) {
      final paginatedResult = result.data!;
      final newUsers =
          paginatedResult.users.where((user) => _userIds.add(user.id)).toList();
      _users.addAll(newUsers);
      _page = paginatedResult.nextPage ?? _page + 1;
      _hasMore = paginatedResult.hasNext;
      _errorMessage = null;
    } else {
      _errorMessage = result.message;
    }

    _isLoading = false;
    notifyListeners();
  }
}
