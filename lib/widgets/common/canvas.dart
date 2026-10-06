import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';

enum Anchor { start, middle, end }

const double _kTextSlot = 1200;

Positioned cText(
  String text,
  double x,
  double y,
  double size, {
  FontWeight weight = FontWeight.w400,
  Color color = AppColors.textPrimary,
  Anchor anchor = Anchor.start,
  double letterSpacing = 0,
}) {
  return cSpans(
    [(text, color)],
    x,
    y,
    size,
    weight: weight,
    anchor: anchor,
    letterSpacing: letterSpacing,
  );
}

Positioned cSpans(
  List<(String, Color)> spans,
  double x,
  double y,
  double size, {
  FontWeight weight = FontWeight.w400,
  Anchor anchor = Anchor.start,
  double letterSpacing = 0,
}) {
  final child = Text.rich(
    TextSpan(
      style: AppText.style(size, weight: weight, letterSpacing: letterSpacing),
      children: [
        for (final (text, color) in spans)
          TextSpan(text: text, style: TextStyle(color: color)),
      ],
    ),
    maxLines: 1,
    softWrap: false,
    textAlign: switch (anchor) {
      Anchor.start => TextAlign.left,
      Anchor.middle => TextAlign.center,
      Anchor.end => TextAlign.right,
    },
  );
  final top = y - AppText.baseline(size);
  return switch (anchor) {
    Anchor.start => Positioned(left: x, top: top, child: child),
    Anchor.middle => Positioned(
      left: x - _kTextSlot / 2,
      top: top,
      width: _kTextSlot,
      child: child,
    ),
    Anchor.end => Positioned(
      left: x - _kTextSlot,
      top: top,
      width: _kTextSlot,
      child: child,
    ),
  };
}

Positioned cBox(
  double x,
  double y,
  double width,
  double height, {
  double radius = 0,
  Color? color,
  Gradient? gradient,
  Color? borderColor,
  double borderWidth = 1,
}) {
  return Positioned(
    left: x,
    top: y,
    width: width,
    height: height,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
        border: borderColor == null
            ? null
            : Border.all(color: borderColor, width: borderWidth),
      ),
    ),
  );
}

Positioned cCircle(
  double cx,
  double cy,
  double r, {
  Color? color,
  Gradient? gradient,
  Color? borderColor,
  double borderWidth = 1,
}) {
  return Positioned(
    left: cx - r,
    top: cy - r,
    width: r * 2,
    height: r * 2,
    child: DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        gradient: gradient,
        border: borderColor == null
            ? null
            : Border.all(color: borderColor, width: borderWidth),
      ),
    ),
  );
}

Positioned cIcon(
  String icon,
  double x,
  double y, {
  double scale = 1,
  Color color = AppColors.mint,
  double stroke = 2,
}) {
  return Positioned(
    left: x,
    top: y,
    child: AppIcon(icon, size: 24 * scale, color: color, strokeWidth: stroke),
  );
}

Positioned cSvg(double x, double y, double width, double height, String svg) {
  return Positioned(
    left: x,
    top: y,
    width: width,
    height: height,
    child: SvgPicture.string(svg, width: width, height: height),
  );
}

Positioned cAt(double x, double y, Widget child) =>
    Positioned(left: x, top: y, child: child);
