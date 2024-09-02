import 'package:flutter/material.dart';
import 'package:check_point/src/login_page/data/login_model.dart';

class UserProvider with ChangeNotifier {
  LoginModel _user = LoginModel(name: '', login: '', password: '');

  LoginModel get user => _user;

  void updateUser(LoginModel user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = LoginModel(name: '', login: '', password: '');
    notifyListeners();
  }
}
