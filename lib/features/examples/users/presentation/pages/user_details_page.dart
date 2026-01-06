import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/utils/app_strings.dart';

import '../../domain/models/user.dart';
import '../widgets/user_avatar.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.fullName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: UserAvatar(
              imageUrl: user.largeAvatarUrl,
              size: 120,
              tag: user.id,
            ),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(user.fullName),
            subtitle: const Text(AppStrings.userDetailsName),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: Text(user.email),
            subtitle: const Text(AppStrings.userDetailsEmail),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: Text(user.phone),
            subtitle: const Text(AppStrings.userDetailsPhone),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: Text(user.country),
            subtitle: const Text(AppStrings.userDetailsCountry),
          ),
        ],
      ),
    );
  }
}
