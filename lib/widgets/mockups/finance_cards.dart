import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/canvas.dart';
import 'package:semsufoco/widgets/common/cards.dart';

/// "Meta do mês" card with a 75% progress bar (236x108).
class GoalMiniCard extends StatelessWidget {
  const GoalMiniCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 236,
      height: 108,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(38, 34, 20, color: AppColors.iconCircle),
          cIcon(AppIcons.target, 26, 22, stroke: 1.9),
          cText('Meta do mês', 70, 30, 12.5, weight: FontWeight.w500, color: AppColors.textMuted),
          cText(r'R$ 2.000,00', 70, 52, 19, weight: FontWeight.w800),
          cBox(20, 78, 196, 8, radius: 4, color: AppColors.progressTrack),
          cBox(20, 78, 147, 8, radius: 4, gradient: AppColors.mintGradient),
          cText(
            '75%',
            216,
            100,
            11,
            weight: FontWeight.w700,
            color: AppColors.mint,
            anchor: Anchor.end,
          ),
        ],
      ),
    );
  }
}

/// "Gasto adicionado" toast (330x76).
class ExpenseToastCard extends StatelessWidget {
  const ExpenseToastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 330,
      height: 76,
      radius: 20,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(40, 38, 20, gradient: AppColors.mintGradient),
          cIcon(AppIcons.check, 30, 28, scale: 0.8333, color: AppColors.onMint, stroke: 3.36),
          cText('Gasto adicionado', 70, 33, 14, weight: FontWeight.w700),
          cText('Supermercado · Alimentação', 70, 52, 11.5, color: AppColors.textMuted),
          cText(
            r'- R$ 120,00',
            312,
            44,
            13,
            weight: FontWeight.w700,
            color: AppColors.red,
            anchor: Anchor.end,
          ),
        ],
      ),
    );
  }
}

/// "+12% este mês" chip (164x46).
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

/// Single transaction row as a floating card (320x68).
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

const _sparkline =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 160">'
    '<defs><linearGradient id="s" x1="0" y1="0" x2="0" y2="1">'
    '<stop offset="0" stop-color="#3CF2A6" stop-opacity="0.35"/>'
    '<stop offset="1" stop-color="#3CF2A6" stop-opacity="0"/></linearGradient></defs>'
    '<path d="M24 138 L24 126 C 60 120, 80 96, 112 104 S 170 84, 200 92 S 250 70, 276 62 L276 138 Z" fill="url(#s)"/>'
    '<path d="M24 126 C 60 120, 80 96, 112 104 S 170 84, 200 92 S 250 70, 276 62" fill="none" stroke="#3CF2A6" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/>'
    '</svg>';

/// "Saldo futuro" card with a sparkline (300x160).
class FutureBalanceCard extends StatelessWidget {
  const FutureBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 300,
      height: 160,
      radius: 26,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.chipBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(44, 44, 22, color: AppColors.iconCircle),
          cIcon(AppIcons.wallet, 32, 32, stroke: 1.9),
          cText('Saldo futuro', 78, 40, 13.5, weight: FontWeight.w500, color: AppColors.textMuted),
          cText(r'R$ 3.500,00', 78, 66, 24, weight: FontWeight.w800),
          cBox(206, 14, 74, 28, radius: 14, color: AppColors.iconCircle),
          cText(
            '+ 15%',
            243,
            33.5,
            13,
            weight: FontWeight.w700,
            color: AppColors.mint,
            anchor: Anchor.middle,
          ),
          cSvg(0, 0, 300, 160, _sparkline),
        ],
      ),
    );
  }
}

const _reportBars = [20.0, 34.0, 28.0, 44.0, 30.0, 50.0, 38.0, 26.0, 46.0, 34.0];

/// "Relatório de setembro" mini bar chart (240x124).
class MonthlyReportCard extends StatelessWidget {
  const MonthlyReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 240,
      height: 124,
      color: AppColors.floatingCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cIcon(AppIcons.fileText, 20, 18, scale: 0.9167, stroke: 2.073),
          cText('Relatório de setembro', 52, 35, 13, weight: FontWeight.w700),
          for (var i = 0; i < _reportBars.length; i++)
            cBox(
              22 + i * 20.444,
              104 - _reportBars[i],
              12,
              _reportBars[i],
              radius: 3,
              gradient: AppColors.bar,
            ),
        ],
      ),
    );
  }
}

/// "Meta do mês" card with the 75% progress ring (320x360).
class GoalRingCard extends StatelessWidget {
  const GoalRingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 320,
      height: 360,
      radius: 30,
      color: AppColors.detailCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cIcon(AppIcons.target, 26, 30, stroke: 1.9),
          cText('Meta do mês', 62, 50, 15, weight: FontWeight.w600, color: AppColors.textMuted),
          const Positioned(
            left: 54,
            top: 82,
            width: 212,
            height: 212,
            child: CustomPaint(painter: GoalRingPainter(progress: 0.75)),
          ),
          cText(
            '75%',
            160,
            202,
            48,
            weight: FontWeight.w800,
            letterSpacing: -1,
            anchor: Anchor.middle,
          ),
          cText(
            'da meta atingida',
            160,
            228,
            12.5,
            color: AppColors.textMuted,
            anchor: Anchor.middle,
          ),
          cBox(28, 308, 264, 1, color: AppColors.rowDivider),
          cText(r'R$ 1.500', 28, 336, 15, weight: FontWeight.w700),
          cText(r'de R$ 2.000', 98.42, 336, 13, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

/// Progress ring: dark track plus a mint sweep-gradient arc from 12 o'clock.
class GoalRingPainter extends CustomPainter {
  const GoalRingPainter({required this.progress, this.strokeWidth = 20});

  final double progress;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = (size.shortestSide - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: radius);

    canvas.drawCircle(
      rect.center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = AppColors.ringTrack,
    );

    // Start the gradient slightly before 12 o'clock so the round start cap
    // stays mint instead of picking up the end color.
    const lead = 0.15;
    final sweep = 2 * math.pi * progress;
    final shader = SweepGradient(
      endAngle: sweep + lead,
      colors: const [AppColors.mint, AppColors.mint, AppColors.mintGradientEnd],
      stops: [0, lead / (sweep + lead), 1],
      transform: const GradientRotation(-math.pi / 2 - lead),
    ).createShader(rect);

    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..shader = shader,
    );
  }

  @override
  bool shouldRepaint(GoalRingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.strokeWidth != strokeWidth;
}

/// Transaction detail card (420x470).
class TransactionDetailCard extends StatelessWidget {
  const TransactionDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 420,
      height: 470,
      radius: 30,
      color: AppColors.detailCardBackground,
      borderColor: AppColors.floatingCardBorder,
      borderWidth: 1.2,
      child: Stack(
        children: [
          cCircle(210, 80, 40, color: AppColors.transactionIcon),
          cIcon(AppIcons.shoppingCart, 192, 62, scale: 1.5, stroke: 1.2),
          cText(
            r'R$ 120,00',
            210,
            172,
            46,
            weight: FontWeight.w800,
            letterSpacing: -1,
            anchor: Anchor.middle,
          ),
          cText(
            'Supermercado',
            210,
            204,
            18,
            weight: FontWeight.w500,
            color: AppColors.textMuted,
            anchor: Anchor.middle,
          ),
          cBox(
            110,
            224,
            200,
            46,
            radius: 23,
            color: AppColors.chipBackground,
            borderColor: AppColors.detailPillBorder,
            borderWidth: 1.2,
          ),
          cCircle(135, 247, 15, color: AppColors.chipIconBackground),
          cIcon(AppIcons.utensils, 127, 239, scale: 0.6667, stroke: 3),
          cText('Alimentação', 161, 252, 14.5, weight: FontWeight.w700),
          cIcon(AppIcons.pencil, 276, 237, scale: 0.8333, stroke: 2.4),

          cBox(
            24,
            292,
            372,
            160,
            radius: 22,
            color: AppColors.panelBackground,
            borderColor: AppColors.cardBorder,
          ),
          cText('Sobre a transação', 46, 326, 16, weight: FontWeight.w700),
          cBox(46, 340, 328, 1, color: AppColors.rowDivider),
          cIcon(AppIcons.calendar, 46, 354, scale: 0.75, stroke: 2.533),
          cText('Data da compra', 76, 368, 13, color: AppColors.textMuted),
          cText(
            'Domingo, 20/09/2026',
            374,
            368,
            13,
            weight: FontWeight.w600,
            anchor: Anchor.end,
          ),
          cBox(46, 384, 328, 1, color: AppColors.rowDivider),
          cIcon(AppIcons.clock, 46, 398, scale: 0.75, stroke: 2.533),
          cText('Horário', 76, 412, 13, color: AppColors.textMuted),
          cText('18:42', 374, 412, 13, weight: FontWeight.w600, anchor: Anchor.end),
          cBox(46, 428, 328, 1, color: AppColors.rowDivider),
          cIcon(AppIcons.fileText, 46, 434, scale: 0.75, stroke: 2.533),
          cText('Adicionar descrição', 76, 448, 13, weight: FontWeight.w600, color: AppColors.mint),
          cIcon(AppIcons.chevronRight, 356, 433, scale: 0.75, stroke: 2.933),
        ],
      ),
    );
  }
}
