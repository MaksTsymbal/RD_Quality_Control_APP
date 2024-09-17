import 'package:check_point/common/theme/dimensions.dart';
import 'package:check_point/common/theme/layout_breakpoint.dart';
import 'package:check_point/common/theme/theme_data.dart';

class CustomThemeData extends AppThemeData {
  const CustomThemeData({
    required super.dimensions,
  });

  factory CustomThemeData.xs() => CustomThemeData(
        dimensions: AppDimensionsData.xs(),
      );

  factory CustomThemeData.s() => CustomThemeData(
        dimensions: AppDimensionsData.s(),
      );

  factory CustomThemeData.m() => CustomThemeData(
        dimensions: AppDimensionsData.m(),
      );

  factory CustomThemeData.l() => CustomThemeData(
        dimensions: AppDimensionsData.l(),
      );

  factory CustomThemeData.xl() => CustomThemeData(
        dimensions: AppDimensionsData.xl(),
      );

  factory CustomThemeData.forLayoutBreakpoint(
    LayoutBreakpoint breakpoint,
  ) =>
      switch (breakpoint) {
        (LayoutBreakpoint.xSmall) => CustomThemeData.xs(),
        (LayoutBreakpoint.small) => CustomThemeData.s(),
        (LayoutBreakpoint.medium) => CustomThemeData.m(),
        (LayoutBreakpoint.large) => CustomThemeData.l(),
        (LayoutBreakpoint.xLarge) => CustomThemeData.xl(),
      };
}
