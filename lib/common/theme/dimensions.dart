class AppDimensionsData {
  const AppDimensionsData._({
    required this.visibleContentCount,
  });

  final int visibleContentCount;

  factory AppDimensionsData.xs() => const AppDimensionsData._(
        visibleContentCount: 1,
      );

  factory AppDimensionsData.s() => const AppDimensionsData._(
        visibleContentCount: 2,
      );

  factory AppDimensionsData.m() => const AppDimensionsData._(
        visibleContentCount: 2,
      );

  factory AppDimensionsData.l() => const AppDimensionsData._(
        visibleContentCount: 3,
      );

  factory AppDimensionsData.xl() => const AppDimensionsData._(
        visibleContentCount: 5,
      );
}
