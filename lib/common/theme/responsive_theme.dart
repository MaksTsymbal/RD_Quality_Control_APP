import 'package:check_point/common/theme/layout_breakpoint.dart';
import 'package:check_point/common/theme/theme.dart';
import 'package:check_point/common/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/providers/theme_provider.dart';
import 'package:check_point/common/theme/app_themes.dart';

class AppResponsiveTheme extends StatelessWidget {
  final AppThemeData Function(LayoutBreakpoint) data;
  final Widget child;

  const AppResponsiveTheme({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;
    AppThemeData themeData;
    if (screenWidth < LayoutBreakpoint.small.minWidth) {
      themeData = data(LayoutBreakpoint.xSmall);
    } else if (screenWidth < LayoutBreakpoint.medium.minWidth) {
      themeData = data(LayoutBreakpoint.small);
    } else if (screenWidth < LayoutBreakpoint.large.minWidth) {
      themeData = data(LayoutBreakpoint.medium);
    } else {
      themeData = size.aspectRatio > 16 / 9
          ? data(LayoutBreakpoint.xLarge)
          : data(LayoutBreakpoint.large);
    }
    return AppTheme(
        data: themeData,
        theme: themeProvider.isDarkMode
            ? AppThemes.darkTheme
            : AppThemes.lightTheme,
        child: child);
  }
}
