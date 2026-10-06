import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/common/section_heading.dart';

/// "DO APERTO À CLAREZA": red "Sem organização" vs green "Com o SemSufoco".
class BeforeAfterSection extends StatelessWidget {
  const BeforeAfterSection({super.key});

  static const _before = ComparisonCard(
    positive: false,
    title: 'Sem organização',
    items: [
      'Planilha que ninguém atualiza',
      'Gastos anotados em vários lugares',
      'Susto quando a fatura chega',
      'Meta guardada só na cabeça',
    ],
  );

  static const _after = ComparisonCard(
    positive: true,
    title: 'Com o SemSufoco',
    items: [
      'Cada gasto registrado em segundos',
      'Categorias claras para tudo',
      'Saldo e saldo futuro sempre à vista',
      'Metas com progresso visível',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        final wide = size == ScreenSize.desktop;
        final header = SectionHeader(
          eyebrow: 'DO APERTO À CLAREZA',
          white: 'Fim do mês sem susto.',
          paragraph: const [
            'Veja a diferença entre improvisar e ter o controle do seu dinheiro na palma da mão.',
          ],
          size: size,
        );
        if (wide) {
          return Padding(
            padding: const EdgeInsets.only(top: 77.27, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header,
                const SizedBox(height: 50.7),
                const SizedBox(
                  height: 420,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: _before),
                      SizedBox(width: 24),
                      Expanded(child: _after),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [header, const SizedBox(height: 40), _before, const SizedBox(height: 20), _after],
          ),
        );
      },
    );
  }
}

class ComparisonCard extends StatelessWidget {
  const ComparisonCard({
    super.key,
    required this.positive,
    required this.title,
    required this.items,
  });

  final bool positive;
  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final accent = positive ? AppColors.mint : AppColors.red;
    final iconBackground = positive ? AppColors.chipIconBackground : AppColors.redIconBackground;
    final icon = positive ? AppIcons.check : AppIcons.x;
    return GlassCard(
      radius: 28,
      gradient: positive ? AppColors.greenCard : AppColors.redCard,
      borderColor: positive ? AppColors.greenCardBorder : AppColors.redCardBorder,
      borderWidth: positive ? 1.2 : 1,
      padding: const EdgeInsets.fromLTRB(24, 30, 32, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: iconBackground, shape: BoxShape.circle),
                child: SizedBox.square(
                  dimension: 44,
                  child: Center(
                    child: AppIcon(
                      icon,
                      size: 20,
                      color: accent,
                      strokeWidth: positive ? 3.12 : 2.88,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Flexible(
                child: Text(
                  title,
                  style: AppText.style(22, weight: FontWeight.w800, lineHeight: 28),
                ),
              ),
            ],
          ),
          const SizedBox(height: 49),
          for (final (i, item) in items.indexed) ...[
            if (i > 0) ...[
              const SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(
                    color: positive ? AppColors.greenDivider : AppColors.redDivider,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(color: iconBackground, shape: BoxShape.circle),
                    child: SizedBox.square(
                      dimension: 26,
                      child: Center(
                        child: AppIcon(
                          icon,
                          size: 14,
                          color: accent,
                          strokeWidth: positive ? 4.457 : 4.114,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      item,
                      style: AppText.style(
                        18,
                        weight: positive ? FontWeight.w600 : FontWeight.w500,
                        color: positive ? AppColors.textPrimary : AppColors.redText,
                        lineHeight: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
