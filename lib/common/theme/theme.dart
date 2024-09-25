import 'package:check_point/common/theme/theme_data.dart';
import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({super.key, required this.data, required super.child});

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
