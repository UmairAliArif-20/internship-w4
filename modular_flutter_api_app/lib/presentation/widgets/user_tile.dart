import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(_initials),
      ),
      title: Text(user.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.email),
          Text(user.company.name),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  String get _initials {
    if (user.name.isEmpty) {
      return '?';
    }

    final words = user.name.trim().split(RegExp(r'\s+'));
    if (words.length == 1) {
      return words.first.substring(0, 1).toUpperCase();
    }

    return '${words.first[0]}${words.last[0]}'.toUpperCase();
  }
}
