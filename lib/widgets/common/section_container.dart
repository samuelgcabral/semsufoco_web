import 'package:flutter/material.dart';

enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

abstract final class Responsive {
  static const double tabletMin = 700;
  static const double desktopMin = 1100;

  static const double content = 1200;

  static ScreenSize of(double viewportWidth) {
    if (viewportWidth >= desktopMin) return ScreenSize.desktop;
    if (viewportWidth >= tabletMin) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static double gutter(double viewportWidth) => viewportWidth < tabletMin ? 20 : 40;
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({super.key, required Widget this.child}) : builder = null;

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

class DesignFrame extends StatelessWidget {
  const DesignFrame({super.key, required this.height, required this.child});

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaledBox(size: Size(Responsive.content, height), child: child);
  }
}

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
