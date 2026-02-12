import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'https://my-gate-backend-1.onrender.com';

  // ---------- LOGIN ----------
  static Future<Map<String, dynamic>> login({
    required String employeeId,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"employeeId": employeeId, "password": password}),
    );

    print('LOGIN STATUS: ${response.statusCode}');
    print('LOGIN BODY: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login failed');
    }
  }

  // ---------- SIGNUP ----------
  static Future<void> signup({
    required String name,
    required String email,
    required String mobile,
    required String department,
    required String committeeName,
    required String designation,
    required String fiveSDesignation,
    required String fiveSTeam,
    required String committeeDesignation,
    required String teamName,
    required String teamDesignation,
    required String gender,
    required String manager,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "name": name,
        "email": email,
        "mobile": mobile,
        "department": department,
        "committeeName": committeeName,
        "designation": designation,
        "fiveSDesignation": fiveSDesignation,
        "fiveSTeam": fiveSTeam,
        "committeeDesignation": committeeDesignation,
        "teamName": teamName,
        "teamDesignation": teamDesignation,
        "gender": gender,
        "manager": manager,
      }),
    );

    print('SIGNUP STATUS: ${response.statusCode}');
    print('SIGNUP BODY: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }

    // if (response.statusCode != 200 && response.statusCode != 201) {
    //   throw Exception('Signup failed');
    //}
  }
}
