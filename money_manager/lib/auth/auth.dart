import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _usersKey = 'users';
  static const String _currentUserKey = 'currentUser';

  Future<bool> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
    String phone,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final usersJson = prefs.getString(_usersKey);
      final users = usersJson != null ? json.decode(usersJson) as List : [];

      // Check if user already exists
      if (users.any((user) => user['email'] == email)) {
        return false;
      }

      // Create new user
      final newUser = {
        'username': username,
        'email': email,
        'password': password, // In a real app, you should hash the password
        'phone': phone,
        'createdAt': DateTime.now().toIso8601String(),
      };

      users.add(newUser);
      await prefs.setString(_usersKey, json.encode(users));
      return true;
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
      final prefs = await SharedPreferences.getInstance();
      final usersJson = prefs.getString(_usersKey);

      if (usersJson == null) return null;

      final users = json.decode(usersJson) as List;
      final user = users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => null,
      );

      if (user != null) {
        // Store current user
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
