import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';

class UserApiClient {
  final http.Client httpClient;

  UserApiClient(this.httpClient);

  Future<List<dynamic>> fetchUsersRaw() async {
    final uri = Uri.parse(ApiConstants.usersUrl);
    final response = await httpClient.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw ServerException(
        'Server returned status code ${response.statusCode}',
        response.statusCode,
      );
    }
  }
}

class ServerException implements Exception {
  final String message;
  final int statusCode;
  ServerException(this.message, this.statusCode);

  @override
  String toString() => 'ServerException: $message (status: $statusCode)';
}
