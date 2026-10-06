import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/common/section_heading.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  static const _steps = [
    (
      '01',
      AppIcons.plus,
      'Registre',
      ['Adicione receitas e despesas em', 'segundos, sempre na data certa.'],
    ),
    (
      '02',
      AppIcons.layers,
      'Organize',
      ['Cada gasto vai para uma categoria,', 'com um extrato só dela.'],
    ),
    (
      '03',
      AppIcons.barChart,
      'Acompanhe',
      ['Veja o saldo, o gráfico do mês e', 'compare com o mês anterior.'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        final desktop = size == ScreenSize.desktop;
        final cards = [
          for (final (number, icon, title, lines) in _steps)
            StepCard(
              number: number,
              icon: icon,
              title: title,
              lines: lines,
              size: size,
            ),
        ];
        return Padding(
          padding: EdgeInsets.only(
            top: desktop ? 127.27 : 64,
            bottom: desktop ? 40 : 64,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                eyebrow: 'COMO FUNCIONA',
                white: 'Três passos para',
                mint: 'respirar mais aliviado.',
                size: size,
              ),
              SizedBox(height: desktop ? 60.73 : 40),
              if (desktop)
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 260),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final (i, card) in cards.indexed) ...[
                          if (i > 0)
                            const SizedBox(
                              width: 36,
                              child: Center(child: _StepChevron()),
                            ),
                          Expanded(child: card),
                        ],
                      ],
                    ),
                  ),
                )
              else
                for (final (i, card) in cards.indexed) ...[
                  if (i > 0)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: _StepChevron(),
                        ),
                      ),
                    ),
                  card,
                ],
            ],
          ),
        );
      },
    );
  }
}

class _StepChevron extends StatelessWidget {
  const _StepChevron();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.eyebrowBackground,
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.floatingCardBorder),
        ),
      ),
      child: SizedBox.square(
        dimension: 32,
        child: Center(
          child: AppIcon(AppIcons.chevronRight, size: 16, strokeWidth: 3.6),
        ),
      ),
    );
  }
}

class StepCard extends StatelessWidget {
  const StepCard({
    super.key,
    required this.number,
    required this.icon,
    required this.title,
    required this.lines,
    required this.size,
  });

  final String number;
  final String icon;
  final String title;
  final List<String> lines;
  final ScreenSize size;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      radius: 28,
      child: Stack(
        children: [
          Positioned(
            right: 36,
            top: 86 - AppText.baseline(64),
            child: Text(
              number,
              style: AppText.style(
                64,
                weight: FontWeight.w800,
                color: AppColors.stepNumber,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 36, 32, 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.iconCircle,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox.square(
                    dimension: 56,
                    child: Center(
                      child: AppIcon(icon, size: 32, strokeWidth: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 30.5),
                Text(
                  title,
                  style: AppText.style(
                    26,
                    weight: FontWeight.w800,
                    lineHeight: 32,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  joinLines(lines, wide: size == ScreenSize.desktop),
                  style: AppText.style(
                    16,
                    color: AppColors.textMuted,
                    lineHeight: 25,
                  ),
                ),
                const SizedBox(height: 14.3),
                const SizedBox(
                  width: 60,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AppColors.mintGradient,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
