import 'package:flutter/material.dart';
import 'package:check_point/common/theme/theme_data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required this.data,
    required this.theme,
    required super.child,
  });

  final AppThemeData data;
  final ThemeData theme;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  static ThemeData themeOf(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.theme;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data || theme != oldWidget.theme;
  }
}
