enum LayoutBreakpoint {
  xSmall(0.0, 576.0),
  small(577.0, 768.0),
  medium(769.0, 1100.0),
  large(1101.0, double.infinity),
  xLarge(1101.0, double.infinity);

  final double minWidth;
  final double maxWidth;

  const LayoutBreakpoint(this.minWidth, this.maxWidth);

  bool get isWide => this != LayoutBreakpoint.xSmall;
}
