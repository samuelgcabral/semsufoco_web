import 'package:flutter/material.dart';

/// Screen classes used across the page.
enum ScreenSize {
  /// < 700px: single column, smaller type, collapsed nav.
  mobile,

  /// 700–1100px: stacked hero/feature blocks, two-column summary cards.
  tablet,

  /// >= 1100px: the SVG composition (scaled down slightly until 1280px).
  desktop,
}

abstract final class Responsive {
  static const double tabletMin = 700;
  static const double desktopMin = 1100;

  /// Width of the design's content column (x 120 → 1320 on the 1440 canvas).
  static const double content = 1200;

  static ScreenSize of(double viewportWidth) {
    if (viewportWidth >= desktopMin) return ScreenSize.desktop;
    if (viewportWidth >= tabletMin) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static double gutter(double viewportWidth) => viewportWidth < tabletMin ? 20 : 40;
}

/// Centers its child in a column of at most [Responsive.content] px, with a
/// horizontal gutter that shrinks on small screens.
///
/// Uses a [LayoutBuilder] rather than `MediaQuery` so sections respond to the
/// space they actually get.
class SectionContainer extends StatelessWidget {
  const SectionContainer({super.key, required Widget this.child}) : builder = null;

  /// Builds the child with the current [ScreenSize] and content width.
  const SectionContainer.builder({
    super.key,
    required Widget Function(BuildContext context, ScreenSize size, double width)
    this.builder,
  }) : child = null;

  final Widget? child;
  final Widget Function(BuildContext context, ScreenSize size, double width)? builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewport = constraints.maxWidth;
        final gutter = Responsive.gutter(viewport);
        final width = (viewport - gutter * 2).clamp(0.0, Responsive.content);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: gutter),
          child: Center(
            child: SizedBox(
              width: width,
              child: child ?? builder!(context, Responsive.of(viewport), width),
            ),
          ),
        );
      },
    );
  }
}

/// A fixed [Responsive.content]-wide composition of the given [height]
/// (coordinates are the SVG's minus x=120), scaled down proportionally when
/// less width is available.
class DesignFrame extends StatelessWidget {
  const DesignFrame({super.key, required this.height, required this.child});

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaledBox(size: Size(Responsive.content, height), child: child);
  }
}

/// Lays out [child] at a fixed [size] and scales it down (never up) to fit the
/// available width — this is how the mockups shrink on small screens without
/// overflowing.
class ScaledBox extends StatelessWidget {
  const ScaledBox({super.key, required this.size, required this.child});

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topCenter,
      child: SizedBox.fromSize(size: size, child: child),
    );
  }
}
