import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:modular_flutter_api_app/main.dart';

void main() {
  testWidgets('Smoke test: app renders users list', (WidgetTester tester) async {
    // Arrange
    final mockClient = MockClient((request) async {
      return http.Response(
        json.encode([
          {
            'id': 1,
            'name': 'Test User',
            'username': 'tester',
            'email': 'test@example.com',
            'address': {
              'street': '1 Main St',
              'suite': 'Apt 1',
              'city': 'City',
              'zipcode': '00000',
              'geo': {'lat': '0', 'lng': '0'},
            },
            'phone': '000-000-0000',
            'website': 'test.example.com',
            'company': {
              'name': 'TestCo',
              'catchPhrase': 'Testing',
              'bs': 'test',
            },
          }
        ]),
        200,
        headers: {'content-type': 'application/json'},
      );
    });

    // Act
    await tester.pumpWidget(MyApp(httpClient: mockClient));
    await tester.pump(); // trigger frame
    await tester.pump(const Duration(milliseconds: 100)); // wait for future to resolve

    // Assert
    expect(find.text('Users'), findsOneWidget);
    expect(find.text('Test User'), findsOneWidget);
    expect(find.text('TestCo'), findsOneWidget);
  });
}