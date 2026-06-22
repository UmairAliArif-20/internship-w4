import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/errors/failure.dart';
import '../models/user_model.dart';
import '../data_sources/user_api_client.dart';

class UserRepository {
  final UserApiClient apiClient;

  UserRepository(this.apiClient);

  Future<List<UserModel>> getUsers() async {
    try {
      final List<dynamic> rawData = await apiClient.fetchUsersRaw();
      return rawData
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on SocketException {
      throw const NetworkFailure('No Internet connection');
    } on FormatException {
      throw const ParsingFailure('Failed to parse JSON response');
    } on http.ClientException {
      throw const NetworkFailure('Network request failed');
    } catch (e) {
      throw NetworkFailure('Unexpected error: $e');
    }
  }
}
