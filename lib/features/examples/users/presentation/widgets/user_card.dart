import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../domain/models/user.dart';
import 'user_avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, required this.onTap});

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: UserAvatar(
          imageUrl: user.largeAvatarUrl,
          size: 40,
          tag: user.id,
        ),
        title: Text(user.fullName),
        subtitle: Text(user.email),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

@Preview(name: 'UserCard')
Widget userCardPreview() {
  return UserCard(
    user: User(
      id: '1',
      firstName: 'John',
      lastName: 'Mclean',
      email: 'john.mclean@example.com',
      largeAvatarUrl: '',
      phone: '+919823453423',
      country: 'US',
    ),
    onTap: () {},
  );
}
