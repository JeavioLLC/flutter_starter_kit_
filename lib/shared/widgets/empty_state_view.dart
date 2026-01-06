import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.inbox_outlined, size: 64),
          SizedBox(height: 12),
          Text(AppStrings.emptyStateTitle),
        ],
      ),
    );
  }
}
