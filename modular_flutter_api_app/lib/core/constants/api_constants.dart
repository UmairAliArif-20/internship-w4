class ApiConstants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String usersEndpoint = '/users';
  static const String avatarBaseUrl =
      'https://api.dicebear.com/7.x/initials/svg';

  static String get usersUrl => '$baseUrl$usersEndpoint';

  static String avatarUrl(String initials) {
    final sanitizedInitials = initials.replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');
    return '$avatarBaseUrl?seed=$sanitizedInitials';
  }
}
