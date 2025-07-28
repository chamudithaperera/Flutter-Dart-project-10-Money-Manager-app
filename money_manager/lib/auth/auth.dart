import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _baseUrl = 'http://localhost:8500/api/users';
  static const String _currentUserKey = 'currentUser';

  Future<bool> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
    String phone,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print("Account creation failed: $e");
      return false;
    }
  }

  Future<Map<String, dynamic>?> logWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final user = json.decode(response.body)['user'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_currentUserKey, json.encode(user));
        return user;
      }
      return null;
    } catch (e) {
      print("Login failed: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_currentUserKey);
    } catch (e) {
      print("Sign out failed: $e");
    }
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_currentUserKey);
      return userJson != null ? json.decode(userJson) : null;
    } catch (e) {
      print("Get current user failed: $e");
      return null;
    }
  }
}
