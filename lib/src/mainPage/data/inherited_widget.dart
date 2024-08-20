import 'package:flutter/material.dart';
import 'package:check_point/src/mainPage/data/info_model.dart';

class UserInheritedWidget extends InheritedWidget {
  final String name;
  final List<InfoModel> data;

  const UserInheritedWidget({
    super.key,
    required this.name,
    required this.data,
    required super.child,
  });

  static UserInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInheritedWidget>();
  }

  static UserInheritedWidget of(BuildContext context) {
    final UserInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No UserInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserInheritedWidget oldWidget) {
    return name != oldWidget.name || data != oldWidget.data;
  }
}
