import 'package:flutter/material.dart';

/// A wrapper that applies a safe area with a customizable background color.
class ColoredSafeArea extends StatelessWidget {
  const ColoredSafeArea({
    required this.child,
    super.key,
    this.color,
    this.top = true,
    this.bottom = true,
    this.borderRadius,
  });

  /// The widget to wrap.
  final Widget child;

  /// The background color for the safe area. Defaults to white.
  final Color? color;

  /// Whether to apply safe area padding to the top.
  final bool top;

  /// Whether to apply safe area padding to the bottom.
  final bool bottom;

  /// Optional border radius to clip the container.
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget content = ColoredBox(
      color: color ?? Colors.white,
      child: SafeArea(
        top: top,
        bottom: bottom,
        child: child,
      ),
    );

    if (borderRadius != null) {
      content = ClipRRect(
        borderRadius: borderRadius!,
        child: content,
      );
    }
    return content;
  }
}
