import 'dart:convert';
import 'package:flutter/services.dart';

class LoginModel {
  final String login;
  final String password;
  final String name;

  LoginModel({required this.login, required this.password, required this.name});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      login: json['login'],
      password: json['password'],
      name: json['name'],
    );
  }

  static Future<List<LoginModel>> loadUserData(String path) async {
    final String response = await rootBundle.loadString(path);
    final List<dynamic> data = json.decode(response);
    return data.map((json) => LoginModel.fromJson(json)).toList();
  }
}
