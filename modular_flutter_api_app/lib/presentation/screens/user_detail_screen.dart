import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../core/constants/api_constants.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final avatarUrl = ApiConstants.avatarUrl(
      user.name.isEmpty ? '?' : user.name.trim().split(' ').take(2).join(' '),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name.isNotEmpty ? user.name : 'User Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              child: ClipOval(
                child: Image.network(
                  avatarUrl,
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(user.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(
              '@${user.username}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            _InfoRow(label: 'Email', value: user.email),
            _InfoRow(label: 'Phone', value: user.phone),
            _InfoRow(label: 'Website', value: user.website),
            const SizedBox(height: 16),
            Text('Address', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('${user.address.street}, ${user.address.suite}'),
            Text('${user.address.city}, ${user.address.zipcode}'),
            const SizedBox(height: 16),
            Text('Company', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(user.company.name),
            Text(user.company.catchPhrase),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
