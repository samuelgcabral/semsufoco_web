import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/buttons.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/reveal_on_scroll.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/common/section_heading.dart';

class FeatureContent {
  const FeatureContent({
    required this.eyebrow,
    required this.titleWhite,
    required this.titleMint,
    required this.paragraph,
    required this.checks,
  });

  final String eyebrow;
  final String titleWhite;
  final String titleMint;

  final List<String> paragraph;
  final List<String> checks;
}

class FeatureBlock extends StatelessWidget {
  const FeatureBlock({
    super.key,
    required this.content,
    required this.visual,
    required this.visualSize,
    required this.height,
    required this.textTop,
    required this.visualOffset,
    this.reversed = false,
    this.onStart,
  });

  final FeatureContent content;
  final Widget visual;
  final Size visualSize;
  final double height;
  final double textTop;
  final Offset visualOffset;
  final bool reversed;
  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        if (size == ScreenSize.desktop) {
          return DesignFrame(
            height: height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: visualOffset.dx,
                  top: visualOffset.dy,
                  child: RevealOnScroll(child: visual),
                ),
                Positioned(
                  left: reversed ? 640 : 0,
                  top: textTop,
                  width: 560,
                  child: _FeatureCopy(
                    content: content,
                    size: size,
                    onStart: onStart,
                  ),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FeatureCopy(content: content, size: size, onStart: onStart),
              const SizedBox(height: 40),
              ScaledBox(
                size: visualSize,
                child: RevealOnScroll(child: visual),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FeatureCopy extends StatelessWidget {
  const _FeatureCopy({required this.content, required this.size, this.onStart});

  final FeatureContent content;
  final ScreenSize size;
  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    final desktop = size == ScreenSize.desktop;
    final mobile = size == ScreenSize.mobile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionEyebrow(content.eyebrow),
        const SizedBox(height: 20),
        SectionTitle(
          white: content.titleWhite,
          mint: content.titleMint,
          size: mobile ? 32 : 44,
          lineHeight: mobile ? 40 : 54,
        ),
        const SizedBox(height: 22),
        Text(
          joinLines(content.paragraph, wide: desktop),
          style: AppText.style(
            mobile ? 16 : 18,
            color: AppColors.textSecondary,
            lineHeight: mobile ? 25 : 29,
          ),
        ),
        SizedBox(height: desktop ? 43 : 28),
        for (final (i, check) in content.checks.indexed) ...[
          if (i > 0) const SizedBox(height: 22),
          FeatureCheckItem(check, wide: !mobile),
        ],
        SizedBox(height: desktop ? 50 : 32),
        ArrowTextLink(label: 'Começar agora', onPressed: onStart),
      ],
    );
  }
}
