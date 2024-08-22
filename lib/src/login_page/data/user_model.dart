import 'dart:convert';
import 'package:flutter/services.dart';

class User {
  final String login;
  final String password;
  final String name;

  User({required this.login, required this.password, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      password: json['password'],
      name: json['name'],
    );
  }

  static Future<List<User>> loadUserData(String path) async {
    final String response = await rootBundle.loadString(path);
    final List<dynamic> data = json.decode(response);
    return data.map((json) => User.fromJson(json)).toList();
  }
}
