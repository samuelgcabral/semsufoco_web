import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/app_logo.dart';
import 'package:semsufoco/widgets/common/canvas.dart';

/// 356x736 phone frame with a 340x720 screen. [screen] is laid out in screen
/// coordinates (a [Stack] of `c*` helpers).
class PhoneMockup extends StatelessWidget {
  const PhoneMockup({super.key, required this.screen});

  static const size = Size(356, 736);

  final Widget screen;

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
                color: AppColors.deviceFrame,
                borderRadius: BorderRadius.circular(46),
                border: Border.all(
                  color: AppColors.deviceFrameBorder,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 8,
            width: 340,
            height: 720,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(38),
              child: ColoredBox(
                color: AppColors.background,
                child: Stack(
                  children: [
                    const Positioned.fill(child: _StatusBar()),
                    Positioned.fill(child: screen),
                    cBox(120, 708, 100, 4, radius: 2, color: AppColors.homeIndicator),
                  ],
                ),
              ),
            ),
          ),
          cBox(133, 18, 90, 24, radius: 12, color: AppColors.deviceIsland),
        ],
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cText('9:41', 26, 35, 14, weight: FontWeight.w700),
        cBox(262, 31, 3, 5, radius: 1, color: AppColors.textPrimary),
        cBox(267, 28, 3, 8, radius: 1, color: AppColors.textPrimary),
        cBox(272, 25, 3, 11, radius: 1, color: AppColors.textPrimary),
        cBox(277, 22, 3, 14, radius: 1, color: AppColors.textPrimary),
        cBox(
          289.4,
          23.4,
          27.2,
          13.2,
          radius: 4,
          borderColor: AppColors.batteryOutline,
          borderWidth: 1.2,
        ),
        cBox(292, 26, 19, 8, radius: 2, color: AppColors.textPrimary),
      ],
    );
  }
}

const _phoneWave =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 308 204">'
    '<defs><linearGradient id="w" x1="0" y1="0" x2="1" y2="1">'
    '<stop offset="0" stop-color="#FFFFFF" stop-opacity="0.1"/>'
    '<stop offset="1" stop-color="#FFFFFF" stop-opacity="0"/></linearGradient></defs>'
    '<path d="M0 50 C 74 10, 134 90, 214 40 S 284 10, 308 26 L308 22 A22 22 0 0 0 286 0 L22 0 A22 22 0 0 0 0 22 Z" fill="url(#w)"/>'
    '</svg>';

const _homeBars = [
  27.58, 35.0, 35.0, 46.67, 35.0, 43.48, 30.76, 47.73, 56.21, 51.97, 51.97, //
  70.0, 46.67, 43.48, 43.48, 35.0, 30.76, 50.91, 43.48, 35.0, 40.3, 27.58,
  13.79, 46.67, 35.0, 30.76,
];

/// App home screen shown in the hero phone.
class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Header
        cAt(16, 56, const AppLogo(scale: 0.78, showText: false)),
        cSpans(
          [('Sem', AppColors.textPrimary), ('Sufoco', AppColors.mint)],
          46,
          78,
          17,
          weight: FontWeight.w800,
        ),
        cIcon(AppIcons.bell, 254, 62, scale: 0.9167, color: AppColors.navLink, stroke: 1.964),
        cCircle(272, 64, 4, color: AppColors.mint),
        cCircle(306, 73, 15, color: AppColors.avatar),
        cText('RJ', 306, 77.5, 11, weight: FontWeight.w700, anchor: Anchor.middle),

        // Balance card
        cBox(
          16,
          100,
          308,
          204,
          radius: 22,
          gradient: AppColors.balanceCard,
          borderColor: AppColors.balanceCardBorder,
        ),
        cSvg(16, 100, 308, 204, _phoneWave),
        cText('Saldo total', 34, 130, 12, weight: FontWeight.w500, color: AppColors.balanceLabel),
        cText(r'R$ 3.000,00', 34, 163, 29, weight: FontWeight.w800),
        cIcon(AppIcons.eye, 225.253, 148, scale: 0.75, color: AppColors.navLink, stroke: 2.4),
        cIcon(AppIcons.arrowUpRight, 34, 175, scale: 0.5833, stroke: 3.771),
        cText('+12%', 52, 187, 12, weight: FontWeight.w700, color: AppColors.mint),
        cText('em relação ao mês anterior', 91.07, 187, 11, color: AppColors.balanceCaption),
        for (var i = 0; i < _homeBars.length; i++)
          cBox(
            34 + i * 10.64,
            288 - _homeBars[i],
            6,
            _homeBars[i],
            radius: 2.4,
            gradient: AppColors.bar,
          ),

        // Shortcuts
        cText('Atalhos rápidos', 16, 336, 15, weight: FontWeight.w700),
        cText(
          'Ver todos',
          324,
          336,
          11,
          weight: FontWeight.w600,
          color: AppColors.mint,
          anchor: Anchor.end,
        ),
        cBox(16, 348, 71, 88, radius: 16, gradient: AppColors.tile),
        cCircle(40, 376, 14, color: AppColors.tileIconActive),
        cIcon(AppIcons.plus, 32, 368, scale: 0.6667, color: AppColors.textPrimary, stroke: 3),
        cText('Nova', 26, 410, 10.5, weight: FontWeight.w700),
        cText('receita', 26, 423, 10.5, weight: FontWeight.w700),
        ..._shortcut(95, AppIcons.minus, const ['Nova', 'despesa']),
        ..._shortcut(174, AppIcons.target, const ['Metas']),
        ..._shortcut(253, AppIcons.fileText, const ['Relatórios']),

        // Recent transactions
        cText('Movimentações recentes', 16, 470, 15, weight: FontWeight.w700),
        cBox(
          16,
          484,
          308,
          157,
          radius: 18,
          color: AppColors.listBackground,
          borderColor: AppColors.tileBorder,
        ),
        ..._transaction(0, AppIcons.shoppingCart, 'Supermercado', 'Alimentação', r'- R$ 120,00', false),
        ..._transaction(1, AppIcons.briefcase, 'Salário', 'Renda', r'+ R$ 2.500,00', true),
        ..._transaction(2, AppIcons.car, 'Posto de combustível', 'Transporte', r'- R$ 200,00', false),

        // Bottom navigation
        cBox(0, 650, 340, 70, color: AppColors.bottomNavBackground),
        cBox(0, 650, 340, 1, color: AppColors.rowDivider),
        ..._navItem(24, AppIcons.home, 'Início', active: true),
        ..._navItem(92, AppIcons.repeat, 'Transações'),
        ..._navItem(160, AppIcons.target, 'Metas'),
        ..._navItem(228, AppIcons.barChart, 'Relatórios'),
        ..._navItem(296, AppIcons.sliders, 'Config.'),
        cBox(16, 648, 36, 3, radius: 1.5, color: AppColors.mint),
      ],
    );
  }

  List<Widget> _shortcut(double x, String icon, List<String> label) {
    return [
      cBox(
        x,
        348,
        71,
        88,
        radius: 16,
        color: AppColors.tileBackground,
        borderColor: AppColors.tileBorder,
      ),
      cCircle(x + 24, 376, 14, color: AppColors.iconCircle),
      cIcon(icon, x + 16, 368, scale: 0.6667, color: AppColors.textPrimary, stroke: 3),
      if (label.length == 2) ...[
        cText(label[0], x + 10, 410, 10.5, weight: FontWeight.w700),
        cText(label[1], x + 10, 423, 10.5, weight: FontWeight.w700),
      ] else
        cText(label[0], x + 10, 418, 10.5, weight: FontWeight.w700),
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
    final cy = 510.0 + index * 52;
    return [
      cCircle(46, cy, 16, color: AppColors.transactionIcon),
      cIcon(icon, 37, cy - 9, scale: 0.75, stroke: 2.533),
      cText(title, 70, cy - 3, 12.5, weight: FontWeight.w600),
      cText(category, 70, cy + 13, 10.5, color: AppColors.textMuted),
      cText(
        amount,
        308,
        cy + 5,
        12,
        weight: FontWeight.w700,
        color: income ? AppColors.mint : AppColors.red,
        anchor: Anchor.end,
      ),
      if (index < 2) cBox(70, cy + 26, 238, 1, color: AppColors.rowDivider),
    ];
  }

  List<Widget> _navItem(double x, String icon, String label, {bool active = false}) {
    final color = active ? AppColors.mint : AppColors.textMuted;
    return [
      cIcon(icon, x, 662, scale: 0.8333, color: color, stroke: 2.28),
      cText(label, x + 10, 698, 9.5, weight: FontWeight.w600, color: color, anchor: Anchor.middle),
    ];
  }
}

/// "Adicionar Gasto" form shown in the quick-entry feature block.
class PhoneAddExpenseScreen extends StatelessWidget {
  const PhoneAddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cBox(
          16,
          52,
          40,
          40,
          radius: 13,
          color: AppColors.backButton,
          borderColor: AppColors.fieldBorder,
        ),
        cIcon(AppIcons.chevronLeft, 27, 63, scale: 0.75, color: AppColors.textPrimary, stroke: 2.933),
        cText('Adicionar Gasto', 170, 78, 17, weight: FontWeight.w700, anchor: Anchor.middle),

        _label('DATA DO LANÇAMENTO', 126),
        _field(138, 58),
        cBox(28, 148, 38, 38, radius: 12, color: AppColors.dateIconBackground),
        cIcon(AppIcons.calendar, 38, 158, scale: 0.75, stroke: 2.533),
        cText('22 de setembro de 2026', 78, 172, 15, weight: FontWeight.w500),
        cIcon(AppIcons.chevronDown, 292, 158, scale: 0.75, color: AppColors.textMuted, stroke: 2.667),

        _label('NOME DO GASTO', 226),
        _field(238, 56),
        cText('Supermercado', 36, 272, 15, weight: FontWeight.w500),

        _label('VALOR', 324),
        _field(336, 56, borderColor: AppColors.detailPillBorder),
        cText(r'R$', 36, 371, 17, weight: FontWeight.w800, color: AppColors.mint),
        cText('120,00', 70, 371, 17, weight: FontWeight.w600),

        _label('CATEGORIA', 422),
        ..._category(16, AppIcons.heart, 'Saúde', AppColors.saudeBackground, AppColors.saude),
        ..._category(95, AppIcons.home, 'Moradia', AppColors.moradiaBackground, AppColors.moradia),
        ..._category(174, AppIcons.car, 'Transporte', AppColors.transporteBackground, AppColors.transporte),
        ..._category(
          253,
          AppIcons.utensils,
          'Alimentação',
          AppColors.alimentacaoBackground,
          AppColors.alimentacao,
          selected: true,
        ),

        cBox(16, 636, 308, 56, radius: 18, gradient: AppColors.mintGradient),
        cText(
          'Adicionar Gasto',
          170,
          670,
          16,
          weight: FontWeight.w800,
          color: AppColors.onMint,
          anchor: Anchor.middle,
        ),
      ],
    );
  }

  Widget _label(String text, double y) => cText(
    text,
    20,
    y,
    10.5,
    weight: FontWeight.w700,
    color: AppColors.fieldLabel,
    letterSpacing: 1,
  );

  Widget _field(double y, double height, {Color borderColor = AppColors.fieldBorder}) => cBox(
    16,
    y,
    308,
    height,
    radius: 18,
    color: AppColors.fieldBackground,
    borderColor: borderColor,
  );

  List<Widget> _category(
    double x,
    String icon,
    String label,
    Color background,
    Color color, {
    bool selected = false,
  }) {
    return [
      cBox(
        x,
        434,
        71,
        83,
        radius: 16,
        color: selected ? AppColors.alimentacaoSelected : AppColors.fieldBackground,
        borderColor: selected ? AppColors.alimentacao : AppColors.fieldBorder,
        borderWidth: selected ? 1.4 : 1,
      ),
      cBox(x + 18, 446, 34, 34, radius: 11, color: background),
      cIcon(icon, x + 26, 454, scale: 0.75, color: color, stroke: 2.533),
      cText(
        label,
        x + 35.5,
        504,
        10,
        weight: FontWeight.w600,
        color: selected ? AppColors.textPrimary : AppColors.categoryLabel,
        anchor: Anchor.middle,
      ),
    ];
  }
}
