import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.scale = 1, this.showText = true});

  final double scale;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    final mark = SizedBox(
      width: 26 * scale,
      height: 28 * scale,
      child: Stack(
        children: [
          _pill(2, 12, 16),
          _pill(15, 2, 26),
        ],
      ),
    );
    if (!showText) return mark;

    final size = 22 * scale;
    return SizedBox(
      height: 28 * scale,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mark,
          SizedBox(width: 10 * scale),
          Padding(
            padding: EdgeInsets.only(top: 24 * scale - AppText.baseline(size, 24 * scale)),
            child: Text.rich(
              TextSpan(
                style: AppText.style(
                  size,
                  weight: FontWeight.w800,
                  lineHeight: 24 * scale,
                ),
                children: const [
                  TextSpan(text: 'Sem'),
                  TextSpan(
                    text: 'Sufoco',
                    style: TextStyle(color: AppColors.mint),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pill(double x, double y, double height) {
    return Positioned(
      left: x * scale,
      top: y * scale,
      width: 9 * scale,
      height: height * scale,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.mintVertical,
          borderRadius: BorderRadius.circular(4.5 * scale),
        ),
      ),
    );
  }
}
