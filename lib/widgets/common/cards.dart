import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    this.width,
    this.height,
    this.radius = 22,
    this.color = AppColors.cardBackground,
    this.gradient,
    this.borderColor = AppColors.cardBorder,
    this.borderWidth = 1,
    this.padding = EdgeInsets.zero,
    this.child,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color color;
  final Gradient? gradient;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: gradient == null ? color : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

/// Rotates its child around its center by [degrees].
class FloatingCard extends StatelessWidget {
  const FloatingCard({super.key, required this.degrees, required this.child});

  final double degrees;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: degrees * math.pi / 180, child: child);
  }
}

/// Soft radial glow of the given radius.
class RadialGlow extends StatelessWidget {
  const RadialGlow({
    super.key,
    required this.radius,
    this.gradient = AppColors.glowSoft,
  });

  final double radius;
  final RadialGradient gradient;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox.square(
        dimension: radius * 2,
        child: DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, gradient: gradient),
        ),
      ),
    );
  }
}

/// Positions a [RadialGlow] centered on (cx, cy) inside a [Stack].
Positioned positionedGlow(
  double cx,
  double cy,
  double r, {
  RadialGradient gradient = AppColors.glowSoft,
}) {
  return Positioned(
    left: cx - r,
    top: cy - r,
    child: RadialGlow(radius: r, gradient: gradient),
  );
}

/// Mint circle with a check mark followed by a feature line.
class FeatureCheckItem extends StatelessWidget {
  const FeatureCheckItem(this.text, {super.key, this.wide = true});

  final String text;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox.square(
          dimension: 22,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.transactionIcon,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AppIcon(
                AppIcons.check,
                size: 11,
                color: AppColors.mint,
                strokeWidth: 5.236,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            text,
            style: AppText.style(
              wide ? 17 : 16,
              weight: FontWeight.w500,
              color: AppColors.navLink,
              lineHeight: 22,
            ),
          ),
        ),
      ],
    );
  }
}
