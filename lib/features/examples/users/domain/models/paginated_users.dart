import 'user.dart';

class PaginatedUsers {
  const PaginatedUsers({
    required this.users,
    required this.page,
    required this.results,
    this.nextPage,
    this.hasNext = false,
  });

  final List<User> users;
  final int page;
  final int results;
  final int? nextPage;
  final bool hasNext;
}
