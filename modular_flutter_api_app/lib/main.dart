import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data/data_sources/user_api_client.dart';
import 'data/repositories/user_repository.dart';
import 'presentation/controllers/user_controller.dart';
import 'presentation/screens/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final http.Client? httpClient;

  const MyApp({super.key, this.httpClient});

  @override
  Widget build(BuildContext context) {
    final client = httpClient ?? http.Client();
    final controller = UserController(
      UserRepository(UserApiClient(client)),
    )..fetchUsers();

    return MaterialApp(
      title: 'Users',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserListScreen(controller: controller),
    );
  }
}