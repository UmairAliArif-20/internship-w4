import 'package:flutter/foundation.dart';

import '../../core/errors/failure.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

enum UserState { idle, loading, success, error }

class UserController extends ChangeNotifier {
  UserState _state = UserState.idle;
  List<UserModel> _users = [];
  String _errorMessage = '';

  UserState get state => _state;
  List<UserModel> get users => _users;
  String get errorMessage => _errorMessage;

  final UserRepository repository;

  UserController(this.repository);

  Future<void> fetchUsers() async {
    _state = UserState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      _users = await repository.getUsers();
      _state = UserState.success;
    } on Failure catch (f) {
      _errorMessage = f.message;
      _state = UserState.error;
    } catch (e) {
      _errorMessage = e.toString();
      _state = UserState.error;
    }

    notifyListeners();
  }
}
