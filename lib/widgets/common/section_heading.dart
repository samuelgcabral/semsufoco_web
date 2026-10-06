import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/section_container.dart';

/// Joins design lines with hard breaks on wide layouts and lets them reflow
/// on narrow ones.
String joinLines(List<String> lines, {required bool wide}) =>
    lines.join(wide ? '\n' : ' ');

/// Small uppercase mint label above section titles.
class SectionEyebrow extends StatelessWidget {
  const SectionEyebrow(this.text, {super.key, this.textAlign = TextAlign.left});

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppText.style(
        13,
        weight: FontWeight.w700,
        color: AppColors.mint,
        letterSpacing: 2,
        lineHeight: 16,
      ),
    );
  }
}

/// Two-tone title: a white line followed by an optional mint line.
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.white,
    this.mint,
    this.size = 46,
    this.lineHeight = 58,
    this.letterSpacing = -1,
    this.textAlign = TextAlign.left,
  });

  final String white;
  final String? mint;
  final double size;
  final double lineHeight;
  final double letterSpacing;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppText.style(
          size,
          weight: FontWeight.w800,
          letterSpacing: letterSpacing,
          lineHeight: lineHeight,
        ),
        children: [
          TextSpan(text: white),
          if (mint != null)
            TextSpan(
              text: '\n$mint',
              style: const TextStyle(color: AppColors.mint),
            ),
        ],
      ),
      textAlign: textAlign,
    );
  }
}

/// Centered eyebrow + title + optional paragraph used by most sections.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.white,
    this.mint,
    this.paragraph,
    this.size = ScreenSize.desktop,
  });

  final String eyebrow;
  final String white;
  final String? mint;
  final List<String>? paragraph;
  final ScreenSize size;

  @override
  Widget build(BuildContext context) {
    final isMobile = size == ScreenSize.mobile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionEyebrow(eyebrow, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        SectionTitle(
          white: white,
          mint: mint,
          size: isMobile ? 32 : 46,
          lineHeight: isMobile ? 40 : 58,
          textAlign: TextAlign.center,
        ),
        if (paragraph != null) ...[
          const SizedBox(height: 20),
          Text(
            joinLines(paragraph!, wide: size == ScreenSize.desktop),
            textAlign: TextAlign.center,
            style: AppText.style(
              isMobile ? 16 : 18,
              color: AppColors.textSecondary,
              lineHeight: isMobile ? 25 : 28,
            ),
          ),
        ],
      ],
    );
  }
}

/// Rounded pill with a mint dot, used for the hero eyebrow and the showcase
/// callouts.
class PillLabel extends StatelessWidget {
  const PillLabel({
    super.key,
    required this.text,
    this.background = AppColors.eyebrowBackground,
    this.borderColor = AppColors.eyebrowBorder,
    this.textColor = AppColors.eyebrowText,
    this.fontSize = 14,
  });

  /// Showcase callout variant.
  const PillLabel.callout({super.key, required this.text})
    : background = AppColors.chipBackground,
      borderColor = AppColors.chipBorder,
      textColor = AppColors.textPrimary,
      fontSize = 13.5;

  final String text;
  final Color background;
  final Color borderColor;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
      child: SizedBox(
        height: 38,
        child: Padding(
          padding: const EdgeInsets.only(left: 14.5, right: 18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox.square(
                dimension: 7,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.mint,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 8.5),
              Flexible(
                child: Text(
                  text,
                  style: AppText.style(
                    fontSize,
                    weight: FontWeight.w600,
                    color: textColor,
                    lineHeight: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
