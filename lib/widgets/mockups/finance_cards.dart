import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/canvas.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/mockups/phone_mockup.dart';

class CategoryMiniCard extends StatelessWidget {
  const CategoryMiniCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 236,
      height: 80,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(40, 40, 20, color: AppColors.categoryFood),
          cIcon(AppIcons.utensils, 29, 29, scale: 0.9167, color: AppColors.textPrimary, stroke: 2.2),
          cText('Alimentação', 72, 34, 12.5, weight: FontWeight.w500, color: AppColors.textMuted),
          cText(r'-R$ 400,50', 72, 58, 19, weight: FontWeight.w800, color: AppColors.red),
        ],
      ),
    );
  }
}

class TrendChip extends StatelessWidget {
  const TrendChip({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 164,
      height: 46,
      radius: 23,
      color: AppColors.chipBackground,
      borderColor: AppColors.chipBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(26, 23, 13, color: AppColors.chipIconBackground),
          cIcon(AppIcons.trendingUp, 19, 16, scale: 0.5833, stroke: 3.943),
          cText('+12% este mês', 48, 29, 14, weight: FontWeight.w700),
        ],
      ),
    );
  }
}

class TransactionFloatCard extends StatelessWidget {
  const TransactionFloatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.category,
    required this.amount,
    required this.income,
  });

  final String icon;
  final String title;
  final String category;
  final String amount;
  final bool income;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 320,
      height: 68,
      radius: 20,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(38, 34, 19, color: AppColors.transactionIcon),
          cIcon(icon, 27, 23, scale: 0.9167, stroke: 2.073),
          cText(title, 68, 31, 13.5, weight: FontWeight.w700),
          cText(category, 68, 50, 11.5, color: AppColors.textMuted),
          cText(
            amount,
            302,
            40,
            13,
            weight: FontWeight.w700,
            color: income ? AppColors.mint : AppColors.red,
            anchor: Anchor.end,
          ),
        ],
      ),
    );
  }
}

class HiddenBalanceChip extends StatelessWidget {
  const HiddenBalanceChip({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 220,
      height: 68,
      radius: 22,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.chipBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(36, 34, 19, color: AppColors.chipIconBackground),
          cIcon(AppIcons.eyeOff, 26, 24, scale: 0.8333, stroke: 2.4),
          cText('Saldo atual', 68, 28, 11.5, weight: FontWeight.w500, color: AppColors.textMuted),
          cText(r'R$ ••••••', 68, 50, 17, weight: FontWeight.w800),
        ],
      ),
    );
  }
}

class MonthPickerCard extends StatelessWidget {
  const MonthPickerCard({super.key});

  static const _months = ['Julho 2026', 'Junho 2026', 'Maio 2026', 'Abril 2026'];

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 220,
      height: 196,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          for (final (i, month) in _months.indexed) ...[
            if (i > 0) cBox(20, 10 + i * 44.0, 180, 1, color: AppColors.rowDivider),
            cText(
              month,
              20,
              38 + i * 44.0,
              14,
              weight: i == 0 ? FontWeight.w700 : FontWeight.w500,
              color: i == 0 ? AppColors.mint : AppColors.textPrimary,
            ),
            if (i == 0) cIcon(AppIcons.check, 180, 22, scale: 0.8333, stroke: 2.9),
          ],
        ],
      ),
    );
  }
}

class BalanceChartCard extends StatelessWidget {
  const BalanceChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 400,
      height: 330,
      radius: 30,
      gradient: AppColors.balanceCard,
      borderColor: AppColors.balanceCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cIcon(AppIcons.wallet, 26, 28, stroke: 1.9),
          cText('Saldo atual', 60, 46, 15, weight: FontWeight.w600, color: AppColors.balanceLabel),
          cBox(
            276,
            24,
            100,
            34,
            radius: 11,
            color: AppColors.monthSelector,
            borderColor: AppColors.monthSelectorBorder,
          ),
          cIcon(AppIcons.calendar, 287, 32, scale: 0.75, color: AppColors.navLink, stroke: 2.53),
          cText('Julho', 311, 46, 13, weight: FontWeight.w500),
          cIcon(AppIcons.chevronDown, 352, 34, scale: 0.6667, color: AppColors.textMuted, stroke: 3),
          cText(r'R$ 3.000,00', 26, 106, 34, weight: FontWeight.w800, letterSpacing: -0.5),
          cIcon(AppIcons.eye, 262, 82, color: AppColors.navLink, stroke: 1.8),
          cIcon(AppIcons.arrowUpRight, 26, 120, scale: 0.75, stroke: 2.9),
          cText('+12%', 48, 135, 14, weight: FontWeight.w700, color: AppColors.mint),
          cText('em relação ao mês anterior', 92, 135, 13, color: AppColors.balanceCaption),
          ...monthChart(
            left: 26,
            width: 348,
            baseline: 286,
            height: 112,
            barWidth: 8,
            labelSize: 11,
          ),
        ],
      ),
    );
  }
}

class TransactionDetailCard extends StatelessWidget {
  const TransactionDetailCard({super.key});

  static const _rows = [
    (AppIcons.calendar, 'Data da compra', '02/07/2026'),
    (AppIcons.clock, 'Horário', '18:42'),
    (AppIcons.store, 'Estabelecimento', 'Restaurante Sabor'),
    (AppIcons.receipt, 'Descrição', 'Jantar'),
  ];

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 420,
      height: 524,
      radius: 30,
      color: AppColors.detailCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cText(
            'Saída',
            210,
            40,
            15,
            weight: FontWeight.w600,
            color: AppColors.textMuted,
            anchor: Anchor.middle,
          ),
          cCircle(210, 96, 36, color: AppColors.transactionIcon, borderColor: AppColors.detailPillBorder),
          cIcon(AppIcons.utensils, 194, 80, scale: 1.3333, stroke: 1.5),
          cText(
            r'- R$ 32,90',
            210,
            182,
            44,
            weight: FontWeight.w800,
            letterSpacing: -1,
            color: AppColors.red,
            anchor: Anchor.middle,
          ),
          cText(
            'Restaurante Sabor',
            210,
            212,
            17,
            weight: FontWeight.w500,
            color: AppColors.textMuted,
            anchor: Anchor.middle,
          ),
          cBox(
            110,
            228,
            200,
            44,
            radius: 22,
            color: AppColors.chipBackground,
            borderColor: AppColors.detailPillBorder,
            borderWidth: 1.2,
          ),
          cIcon(AppIcons.utensils, 128, 240, scale: 0.8333, stroke: 2.4),
          cText('Alimentação', 156, 255, 14.5, weight: FontWeight.w700),
          cIcon(AppIcons.pencil, 276, 241, scale: 0.75, stroke: 2.6),

          cBox(
            24,
            292,
            372,
            214,
            radius: 22,
            color: AppColors.panelBackground,
            borderColor: AppColors.cardBorder,
          ),
          cText('Sobre a transação', 46, 326, 16, weight: FontWeight.w700),
          for (final (i, (icon, label, value)) in _rows.indexed) ...[
            cBox(46, 340 + i * 40.0, 328, 1, color: AppColors.rowDivider),
            cIcon(icon, 46, 352 + i * 40.0, scale: 0.75, stroke: 2.533),
            cText(label, 76, 366 + i * 40.0, 13, color: AppColors.textMuted),
            cText(value, 374, 366 + i * 40.0, 13, weight: FontWeight.w600, anchor: Anchor.end),
          ],
        ],
      ),
    );
  }
}
