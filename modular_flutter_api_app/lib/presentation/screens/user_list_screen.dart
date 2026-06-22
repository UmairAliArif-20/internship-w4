import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';
import 'user_detail_screen.dart';
import '../widgets/error_view.dart';
import '../widgets/loading_spinner.dart';
import '../widgets/user_tile.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({required this.controller, super.key});

  final UserController controller;

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.controller.state == UserState.idle) {
      widget.controller.fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          switch (widget.controller.state) {
            case UserState.idle:
            case UserState.loading:
              return const LoadingSpinner();
            case UserState.error:
              return ErrorView(
                message: widget.controller.errorMessage,
                onRetry: widget.controller.fetchUsers,
              );
            case UserState.success:
              final users = widget.controller.users;
              if (users.isEmpty) {
                return const Center(child: Text('No users found'));
              }
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserTile(
                    user: user,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => UserDetailScreen(user: user),
                        ),
                      );
                    },
                  );
                },
              );
          }
        },
      ),
    );
  }
}
