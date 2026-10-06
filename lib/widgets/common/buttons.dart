import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';

/// Shared hover handling: pointer cursor plus a small lift.
class _Hoverable extends StatefulWidget {
  const _Hoverable({required this.onTap, required this.builder});

  final VoidCallback? onTap;
  final Widget Function(bool hovered) builder;

  @override
  State<_Hoverable> createState() => _HoverableState();
}

class _HoverableState extends State<_Hoverable> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: widget.builder(_hovered),
      ),
    );
  }
}

/// Mint gradient pill button.
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    this.onPressed,
    this.height = 60,
    this.horizontalPadding = 29.4,
    this.fontSize = 17,
    this.trailingArrow = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final double horizontalPadding;
  final double fontSize;
  final bool trailingArrow;

  @override
  Widget build(BuildContext context) {
    return _Hoverable(
      onTap: onPressed,
      builder: (hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: height,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        transform: Matrix4.translationValues(0, hovered ? -2 : 0, 0),
        decoration: BoxDecoration(
          gradient: AppColors.mintGradient,
          borderRadius: BorderRadius.circular(height / 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.mint.withValues(alpha: hovered ? 0.35 : 0),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppText.style(
                fontSize,
                weight: FontWeight.w700,
                color: AppColors.onMint,
                lineHeight: fontSize * 1.25,
              ),
            ),
            if (trailingArrow) ...[
              const SizedBox(width: 12),
              const AppIcon(
                AppIcons.arrowRight,
                size: 18,
                color: AppColors.onMint,
                strokeWidth: 2.933,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Dark outlined pill button.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.height = 60,
    this.horizontalPadding = 37.7,
    this.fontSize = 17,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final double horizontalPadding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return _Hoverable(
      onTap: onPressed,
      builder: (hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding - 1),
        decoration: BoxDecoration(
          color: AppColors.secondaryButtonBackground,
          borderRadius: BorderRadius.circular(height / 2),
          border: Border.all(
            color: hovered ? AppColors.chipBorder : AppColors.secondaryButtonBorder,
          ),
        ),
        child: Text(
          label,
          style: AppText.style(
            fontSize,
            weight: FontWeight.w700,
            lineHeight: fontSize * 1.25,
          ),
        ),
      ),
    );
  }
}

/// Mint "Começar agora →" text link.
class ArrowTextLink extends StatelessWidget {
  const ArrowTextLink({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return _Hoverable(
      onTap: onPressed,
      builder: (hovered) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppText.style(
              16,
              weight: FontWeight.w700,
              color: AppColors.mint,
              lineHeight: 20,
            ),
          ),
          AnimatedPadding(
            duration: const Duration(milliseconds: 180),
            padding: EdgeInsets.only(left: hovered ? 16 : 12),
            child: const AppIcon(
              AppIcons.arrowRight,
              size: 18,
              color: AppColors.mint,
              strokeWidth: 2.933,
            ),
          ),
        ],
      ),
    );
  }
}

/// Plain text link used in the nav bar and footer.
class NavTextLink extends StatelessWidget {
  const NavTextLink({
    super.key,
    required this.label,
    this.onPressed,
    this.fontSize = 15,
    this.weight = FontWeight.w500,
    this.color = AppColors.navLink,
  });

  final String label;
  final VoidCallback? onPressed;
  final double fontSize;
  final FontWeight weight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _Hoverable(
      onTap: onPressed,
      builder: (hovered) => Text(
        label,
        style: AppText.style(
          fontSize,
          weight: weight,
          color: hovered ? AppColors.mint : color,
          lineHeight: 20,
        ),
      ),
    );
  }
}
