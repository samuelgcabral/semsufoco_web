import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/canvas.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/section_container.dart';

class SummaryCardsSection extends StatelessWidget {
  const SummaryCardsSection({super.key});

  static const _cards = [
    SummaryCard(
      icon: AppIcons.arrowUpRight,
      label: 'Receitas',
      value: r'R$ 4.250,00',
      delta: '+ 8%',
    ),
    SummaryCard(
      icon: AppIcons.arrowDown,
      label: 'Despesas',
      value: r'R$ 1.250,00',
      delta: '- 4%',
      negative: true,
    ),
    SummaryCard(
      icon: AppIcons.target,
      label: 'Meta do mês',
      value: r'R$ 2.000,00',
      progress: 0.75,
    ),
    SummaryCard(
      icon: AppIcons.wallet,
      label: 'Saldo futuro',
      value: r'R$ 3.500,00',
      delta: '+ 15%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        final wide = size == ScreenSize.desktop;
        final columns = switch (size) {
          ScreenSize.desktop => 4,
          ScreenSize.tablet => 2,
          ScreenSize.mobile => 1,
        };
        return Padding(
          padding: EdgeInsets.only(top: wide ? 30.6 : 48, bottom: wide ? 40 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'SEU MÊS EM UM RELANCE',
                textAlign: TextAlign.center,
                style: AppText.style(
                  12,
                  weight: FontWeight.w700,
                  color: AppColors.textMuted,
                  letterSpacing: 2.4,
                  lineHeight: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Dados de exemplo',
                textAlign: TextAlign.center,
                style: AppText.style(12, color: AppColors.textSubtle, lineHeight: 16),
              ),
              const SizedBox(height: 22.4),
              for (var row = 0; row < _cards.length; row += columns) ...[
                if (row > 0) const SizedBox(height: 24),
                Row(
                  children: [
                    for (var i = row; i < row + columns; i++) ...[
                      if (i > row) const SizedBox(width: 24),
                      Expanded(child: _cards[i]),
                    ],
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.delta,
    this.negative = false,
    this.progress,
  });

  final String icon;
  final String label;
  final String value;
  final String? delta;
  final bool negative;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    final accent = negative ? AppColors.red : AppColors.mint;
    return GlassCard(
      height: 130,
      child: Stack(
        children: [
          cCircle(
            42,
            40,
            20,
            color: negative ? AppColors.redSummaryIcon : AppColors.iconCircle,
          ),
          cIcon(icon, 30, 28, color: accent),
          cText(label, 72, 45, 14, weight: FontWeight.w500, color: AppColors.textMuted),
          cText(value, 24, 96, 26, weight: FontWeight.w800),
          if (delta != null)
            _rightText(delta!, 96, 13, accent),
          if (progress != null) ...[
            Positioned(
              left: 24,
              right: 88,
              top: 108,
              height: 7,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.progressTrack,
                  borderRadius: BorderRadius.circular(3.5),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AppColors.mintGradient,
                      borderRadius: BorderRadius.circular(3.5),
                    ),
                  ),
                ),
              ),
            ),
            _rightText('${(progress! * 100).round()}%', 114, 12.5, AppColors.mint),
          ],
        ],
      ),
    );
  }

  Widget _rightText(String text, double baseline, double size, Color color) {
    return Positioned(
      right: 24,
      top: baseline - AppText.baseline(size),
      child: Text(text, style: AppText.style(size, weight: FontWeight.w700, color: color)),
    );
  }
}
