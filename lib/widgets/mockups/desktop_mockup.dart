import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/app_logo.dart';
import 'package:semsufoco/widgets/common/canvas.dart';

const _desktopWave =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 560 300">'
    '<defs><linearGradient id="w" x1="0" y1="0" x2="1" y2="1">'
    '<stop offset="0" stop-color="#FFFFFF" stop-opacity="0.1"/>'
    '<stop offset="1" stop-color="#FFFFFF" stop-opacity="0"/></linearGradient></defs>'
    '<path d="M0 74 C 122 14, 242 124, 382 54 S 522 14, 560 34 L560 24 A24 24 0 0 0 536 0 L24 0 A24 24 0 0 0 0 24 Z" fill="url(#w)"/>'
    '</svg>';

const _desktopBars = [
  42.25, 53.62, 53.62, 71.5, 53.62, 66.62, 47.12, 73.12, 86.12, 79.62,
  79.62, 107.25, 71.5, 66.62, 66.62, 53.62, 47.12, 78.0, 66.62, 53.62,
  61.75, 42.25, 21.12, 71.5, 53.62, 47.12, 32.5, 9.75, 25.35, 16.9,
];

const _xLabels = [
  ('01', 276.5),
  ('05', 335.948),
  ('10', 410.259),
  ('15', 484.569),
  ('20', 558.879),
  ('25', 633.19),
  ('30', 707.5),
];

class DesktopMockup extends StatelessWidget {
  const DesktopMockup({super.key});

  static const size = Size(1100, 604);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.desktopFrame,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: AppColors.desktopFrameBorder,
                  width: 1.5,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Stack(
                children: [
                  cBox(0, 0, 1100, 44, color: AppColors.browserBar),
                  cBox(0, 44, 1100, 1, color: AppColors.browserDivider),
                  cCircle(26, 22, 6, color: AppColors.trafficRed),
                  cCircle(46, 22, 6, color: AppColors.trafficYellow),
                  cCircle(66, 22, 6, color: AppColors.trafficGreen),
                  cBox(430, 11, 240, 22, radius: 11, color: AppColors.urlBar),
                  cText(
                    'SemSufoco',
                    550,
                    26.5,
                    11.5,
                    weight: FontWeight.w500,
                    color: AppColors.textMuted,
                    anchor: Anchor.middle,
                  ),
                  const Positioned(
                    left: 0,
                    top: 44,
                    width: 1100,
                    height: 560,
                    child: _DesktopBody(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cBox(0, 0, 150, 560, color: AppColors.sidebar),
        cBox(150, 0, 1, 560, color: AppColors.sidebarDivider),
        cAt(62, 20, const AppLogo(scale: 0.9, showText: false)),
        cBox(16, 84, 118, 64, radius: 14, color: AppColors.sidebarActive),
        ..._sideItem(95, AppIcons.home, 'Início', active: true),
        ..._sideItem(171, AppIcons.repeat, 'Transações'),
        ..._sideItem(247, AppIcons.target, 'Metas'),
        ..._sideItem(323, AppIcons.barChart, 'Relatórios'),
        ..._sideItem(399, AppIcons.sliders, 'Configurações'),

        cSpans(
          [('Sem', AppColors.textPrimary), ('Sufoco', AppColors.mint)],
          180,
          38,
          21,
          weight: FontWeight.w800,
        ),
        cText('Controle hoje, conquiste amanhã.', 180, 58, 11.5, color: AppColors.textMuted),
        cIcon(AppIcons.bell, 998, 22, scale: 0.9167, color: AppColors.navLink, stroke: 1.964),
        cCircle(1017, 24, 4, color: AppColors.mint),
        cCircle(1052, 34, 17, color: AppColors.avatar),
        cText('RJ', 1052, 38.5, 12, weight: FontWeight.w700, anchor: Anchor.middle),
        cIcon(AppIcons.chevronDown, 1068, 26, scale: 0.6667, color: AppColors.textMuted, stroke: 3),

        cBox(
          178,
          76,
          560,
          300,
          radius: 24,
          gradient: AppColors.balanceCard,
          borderColor: AppColors.balanceCardBorder,
        ),
        cSvg(178, 76, 560, 300, _desktopWave),
        cText('Saldo total', 202, 110, 14, weight: FontWeight.w500, color: AppColors.balanceLabel),
        cText(r'R$ 3.000,00', 202, 152, 40, weight: FontWeight.w800),
        cIcon(AppIcons.eye, 466.008, 132, scale: 0.9167, color: AppColors.navLink, stroke: 1.964),
        cIcon(AppIcons.arrowUpRight, 202, 166, scale: 0.6667, stroke: 3.3),
        cText('+12%', 224, 179, 14, weight: FontWeight.w700, color: AppColors.mint),
        cText('em relação ao mês anterior', 270.575, 179, 13, color: AppColors.balanceCaption),
        cBox(
          572,
          92,
          148,
          34,
          radius: 11,
          color: AppColors.monthSelector,
          borderColor: AppColors.monthSelectorBorder,
        ),
        cIcon(AppIcons.calendar, 584, 100, scale: 0.6667, color: AppColors.navLink, stroke: 2.85),
        cText('Setembro 2026', 606, 114, 11.5, weight: FontWeight.w500),
        cIcon(AppIcons.chevronDown, 696, 102, scale: 0.5833, color: AppColors.textMuted, stroke: 3.429),
        for (final (i, label) in const [
          r'R$ 4.000',
          r'R$ 3.000',
          r'R$ 2.000',
          r'R$ 1.000',
          r'R$ 0',
        ].indexed) ...[
          cText(label, 202, 220 + i * 32.5, 10.5, color: AppColors.textMuted),
          cBox(266, 216 + i * 32.5, 452, 1, color: AppColors.chartGrid),
        ],
        for (var i = 0; i < _desktopBars.length; i++)
          cBox(
            272 + i * 14.862,
            346 - _desktopBars[i],
            9,
            _desktopBars[i],
            radius: 3,
            gradient: AppColors.bar,
          ),
        for (final (label, x) in _xLabels)
          cText(label, x, 366, 10.5, color: AppColors.textMuted, anchor: Anchor.middle),

        cBox(
          762,
          76,
          310,
          300,
          radius: 24,
          color: AppColors.panelBackground,
          borderColor: AppColors.cardBorder,
        ),
        cText('Movimentações recentes', 784, 110, 15, weight: FontWeight.w700),
        ..._transaction(0, AppIcons.shoppingCart, 'Supermercado', 'Alimentação', r'- R$ 120,00', false),
        ..._transaction(1, AppIcons.briefcase, 'Salário', 'Renda', r'+ R$ 2.500,00', true),
        ..._transaction(2, AppIcons.car, 'Posto de combustível', 'Transporte', r'- R$ 200,00', false),
        ..._transaction(3, AppIcons.gamepad, 'Steam', 'Lazer', r'- R$ 59,90', false),

        cText('Atalhos rápidos', 178, 420, 17, weight: FontWeight.w700),
        cText(
          'Ver todos',
          1072,
          420,
          12.5,
          weight: FontWeight.w600,
          color: AppColors.mint,
          anchor: Anchor.end,
        ),
        ..._shortcut(178, AppIcons.plus, 'Nova receita', primary: true),
        ..._shortcut(405, AppIcons.minus, 'Nova despesa'),
        ..._shortcut(632, AppIcons.target, 'Metas'),
        ..._shortcut(859, AppIcons.fileText, 'Relatórios'),
      ],
    );
  }

  List<Widget> _sideItem(double y, String icon, String label, {bool active = false}) {
    return [
      cIcon(icon, 63, y, color: active ? AppColors.mint : AppColors.textMuted, stroke: 1.9),
      cText(
        label,
        75,
        y + 41,
        11.5,
        weight: FontWeight.w600,
        color: active ? AppColors.textPrimary : AppColors.textMuted,
        anchor: Anchor.middle,
      ),
    ];
  }

  List<Widget> _transaction(
    int index,
    String icon,
    String title,
    String category,
    String amount,
    bool income,
  ) {
    final cy = 157.0 + index * 62;
    return [
      cCircle(808, cy, 18, color: AppColors.transactionIcon),
      cIcon(icon, 798, cy - 10, scale: 0.8333, stroke: 2.28),
      cText(title, 838, cy - 3, 12.5, weight: FontWeight.w600),
      cText(category, 838, cy + 15, 11.5, color: AppColors.textMuted),
      cText(
        amount,
        1050,
        cy + 5,
        12.5,
        weight: FontWeight.w700,
        color: income ? AppColors.mint : AppColors.red,
        anchor: Anchor.end,
      ),
      if (index < 3) cBox(838, cy + 31, 212, 1, color: AppColors.rowDivider),
    ];
  }

  List<Widget> _shortcut(double x, String icon, String label, {bool primary = false}) {
    return [
      if (primary)
        cBox(x, 436, 213, 92, radius: 20, gradient: AppColors.tile)
      else
        cBox(
          x,
          436,
          213,
          92,
          radius: 20,
          color: AppColors.tileBackground,
          borderColor: AppColors.tileBorder,
        ),
      cCircle(x + 34, 470, 18, color: primary ? AppColors.tileIconActive : AppColors.iconCircle),
      cIcon(icon, x + 23, 459, scale: 0.9167, color: AppColors.textPrimary, stroke: 2.182),
      cText(label, x + 18, 512, 14, weight: FontWeight.w700),
      cIcon(
        AppIcons.arrowRight,
        x + 173,
        497,
        scale: 0.75,
        color: primary ? AppColors.textPrimary : AppColors.textMuted,
        stroke: 2.667,
      ),
    ];
  }
}
