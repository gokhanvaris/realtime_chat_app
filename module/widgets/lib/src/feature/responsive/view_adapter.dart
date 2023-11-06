import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// make a adaptive ui for all platforms
final class ViewAdapter extends StatelessWidget {
  /// define custom widget for every platform
  const ViewAdapter({
    required this.phone,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  /// define custom widget

  final Widget phone;

  /// define custom widget

  final Widget tablet;

  /// define custom widget

  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;
    if (ResponsiveBreakpoints.of(context).isDesktop) return desktop;

    return phone;
  }
}
