import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/canvas.dart';

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

class ScaledPhone extends StatelessWidget {
  const ScaledPhone({super.key, required this.scale, required this.screen});

  final double scale;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PhoneMockup.size.width * scale,
      height: PhoneMockup.size.height * scale,
      child: FittedBox(child: PhoneMockup(screen: screen)),
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

enum PhoneTab { add, home, categories }

List<Widget> _bottomNav(PhoneTab active) {
  const items = [
    (PhoneTab.add, 57.0, AppIcons.plusCircle, 'Adicionar'),
    (PhoneTab.home, 170.0, AppIcons.home, 'Home'),
    (PhoneTab.categories, 283.0, AppIcons.layoutGrid, 'Categorias'),
  ];
  return [
    cBox(0, 650, 340, 70, color: AppColors.bottomNavBackground),
    cBox(0, 650, 340, 1, color: AppColors.rowDivider),
    for (final (tab, cx, icon, label) in items)
      if (tab == active) ...[
        cCircle(cx, 668, 19, gradient: AppColors.mintGradient),
        cIcon(icon, cx - 10, 658, scale: 0.8333, color: AppColors.onMint, stroke: 2.4),
        cText(label, cx, 703, 9.5, weight: FontWeight.w700, anchor: Anchor.middle),
      ] else ...[
        cIcon(icon, cx - 10, 662, scale: 0.8333, color: AppColors.textMuted, stroke: 2.28),
        cText(
          label,
          cx,
          703,
          9.5,
          weight: FontWeight.w600,
          color: AppColors.textMuted,
          anchor: Anchor.middle,
        ),
      ],
  ];
}

Widget _screenTitle(String title) =>
    cText(title, 170, 80, 16, weight: FontWeight.w700, anchor: Anchor.middle);

const _chartGroups = [
  (0.92, 0.6, 0.34),
  (0.12, 0.42, 0.0),
  (0.08, 0.36, 0.0),
  (0.4, 0.3, 0.1),
  (0.06, 0.2, 0.0),
  (0.1, 0.26, 0.0),
  (0.0, 0.1, 0.0),
];

List<Widget> monthChart({
  required double left,
  required double width,
  required double baseline,
  required double height,
  required double barWidth,
  required double labelSize,
}) {
  final step = width / _chartGroups.length;
  final groupWidth = barWidth * 3 + 4;
  return [
    for (var i = 0; i <= 2; i++)
      cBox(left, baseline - height * i / 2, width, 1, color: AppColors.chartGrid),
    for (final (g, values) in _chartGroups.indexed) ...[
      for (final (b, value) in [values.$1, values.$2, values.$3].indexed)
        if (value > 0)
          cBox(
            left + g * step + (step - groupWidth) / 2 + b * (barWidth + 2),
            baseline - height * value,
            barWidth,
            height * value,
            radius: 2,
            gradient: AppColors.bar,
          ),
      cText(
        '${g * 5}',
        left + g * step + step / 2,
        baseline + labelSize + 6,
        labelSize,
        color: AppColors.textMuted,
        anchor: Anchor.middle,
      ),
    ],
  ];
}

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cText('Olá, Rafael', 16, 80, 19, weight: FontWeight.w800),
        cText('Vamos conquistar seus objetivos', 16, 99, 11.5, color: AppColors.textMuted),
        cCircle(306, 82, 17, color: AppColors.avatar),
        cIcon(AppIcons.settings, 297, 73, scale: 0.75, color: AppColors.textPrimary, stroke: 2.4),

        cBox(
          16,
          116,
          308,
          214,
          radius: 22,
          gradient: AppColors.balanceCard,
          borderColor: AppColors.balanceCardBorder,
        ),
        cIcon(AppIcons.wallet, 32, 131, scale: 0.6667, stroke: 2.7),
        cText('Saldo atual', 54, 144, 12, weight: FontWeight.w500, color: AppColors.balanceLabel),
        cBox(
          232,
          128,
          78,
          26,
          radius: 9,
          color: AppColors.monthSelector,
          borderColor: AppColors.monthSelectorBorder,
        ),
        cIcon(AppIcons.calendar, 240, 134, scale: 0.5833, color: AppColors.navLink, stroke: 3.2),
        cText('Julho', 258, 145, 11, weight: FontWeight.w500),
        cIcon(AppIcons.chevronDown, 290, 135, scale: 0.5, color: AppColors.textMuted, stroke: 3.6),
        cText(r'R$ 3.000,00', 32, 180, 27, weight: FontWeight.w800),
        cIcon(AppIcons.eye, 218, 161, scale: 0.75, color: AppColors.navLink, stroke: 2.4),
        cIcon(AppIcons.arrowUpRight, 32, 190, scale: 0.5833, stroke: 3.771),
        cText('+12%', 50, 202, 12, weight: FontWeight.w700, color: AppColors.mint),
        cText('em relação ao mês anterior', 89, 202, 11, color: AppColors.balanceCaption),
        ...monthChart(
          left: 32,
          width: 276,
          baseline: 298,
          height: 76,
          barWidth: 5,
          labelSize: 9,
        ),

        cText('Categorias', 16, 356, 15, weight: FontWeight.w700),
        ..._categoryCard(16, AppIcons.utensils, AppColors.categoryFood, 'Alimentação', r'-R$ 400,50'),
        ..._categoryCard(122, AppIcons.home, AppColors.categoryHousing, 'Moradia', r'-R$ 2.345,50'),
        ..._categoryCard(228, AppIcons.car, AppColors.categoryTransport, 'Transporte', r'-R$ 886,70'),

        cBox(
          16,
          482,
          308,
          160,
          radius: 18,
          color: AppColors.listBackground,
          borderColor: AppColors.tileBorder,
        ),
        cIcon(AppIcons.barChart, 28, 492, scale: 0.6667, stroke: 3),
        cText('Movimentações', 50, 505, 13, weight: FontWeight.w700),
        cText('Adicionar', 292, 505, 11, weight: FontWeight.w600, color: AppColors.mint, anchor: Anchor.end),
        cIcon(AppIcons.plusCircle, 296, 495, scale: 0.5, stroke: 3.6),
        cBox(28, 516, 284, 1, color: AppColors.rowDivider),
        ..._transaction(0, AppIcons.utensils, 'Restaurante Sabor', 'Alimentação', r'R$ 32,90', '02/07/2026', false),
        ..._transaction(1, AppIcons.wallet, 'Salário', 'Salário', r'R$ 2.350,00', '05/07/2026', true),
        ..._transaction(2, AppIcons.car, 'Oficina Blumenau', 'Transporte', r'R$ 180,00', '07/07/2026', false),

        ..._bottomNav(PhoneTab.home),
      ],
    );
  }

  List<Widget> _categoryCard(double x, String icon, Color color, String name, String value) {
    return [
      cBox(
        x,
        368,
        96,
        100,
        radius: 12,
        color: AppColors.tileBackground,
        borderColor: AppColors.tileBorder,
      ),
      cCircle(x + 23, 391, 13, color: color),
      cIcon(icon, x + 16, 384, scale: 0.5833, color: AppColors.textPrimary, stroke: 3.2),
      cText(name, x + 10, 440, 10.5, weight: FontWeight.w600, color: AppColors.textMuted),
      cText(value, x + 10, 456, 11, weight: FontWeight.w700, color: AppColors.red),
    ];
  }

  List<Widget> _transaction(
    int index,
    String icon,
    String title,
    String category,
    String amount,
    String date,
    bool income,
  ) {
    final y = 522.0 + index * 40;
    return [
      cBox(28, y + 6, 30, 28, radius: 8, color: AppColors.transactionIcon),
      cIcon(icon, 34, y + 11, scale: 0.75, stroke: 2.533),
      cText(title, 66, y + 18, 12, weight: FontWeight.w600),
      cText(category, 66, y + 32, 10, color: AppColors.textMuted),
      cText(
        amount,
        292,
        y + 18,
        11.5,
        weight: FontWeight.w700,
        color: income ? AppColors.mint : AppColors.red,
        anchor: Anchor.end,
      ),
      cText(date, 292, y + 32, 9.5, color: AppColors.textMuted, anchor: Anchor.end),
      cIcon(AppIcons.chevronRight, 297, y + 14, scale: 0.5, color: AppColors.textMuted, stroke: 3.6),
      if (index < 2) cBox(66, y + 40, 246, 1, color: AppColors.rowDivider),
    ];
  }
}

class PhoneNewTransactionScreen extends StatelessWidget {
  const PhoneNewTransactionScreen({super.key});

  static const _payments = [
    (AppIcons.creditCard, 'Crédito'),
    (AppIcons.wallet, 'Débito'),
    (AppIcons.pix, 'Pix'),
    (AppIcons.banknote, 'Dinheiro'),
  ];

  @override
  Widget build(BuildContext context) {
    const cardWidth = 276.0;
    const categoryWidth = (cardWidth - 20) / 3;
    const paymentWidth = (cardWidth - 24) / 4;
    return Stack(
      children: [
        _screenTitle('Novo lançamento'),
        cIcon(AppIcons.camera, 298, 66, scale: 0.8333, stroke: 2.28),

        cBox(
          16,
          100,
          308,
          496,
          radius: 20,
          color: AppColors.panelBackground,
          borderColor: AppColors.cardBorder,
        ),
        cText('Sobre a transação', 32, 130, 13, weight: FontWeight.w600),

        ..._field(32, 146, AppIcons.calendar, '02/07/2026'),
        ..._field(176, 146, AppIcons.clock, '18:42'),
        cBox(32, 178, cardWidth, 1, color: AppColors.rowDivider),
        ..._field(32, 190, AppIcons.store, 'Restaurante Sabor'),
        cBox(32, 222, cardWidth, 1, color: AppColors.rowDivider),
        cIcon(AppIcons.dollarSign, 32, 236, scale: 0.75, stroke: 2.533),
        cText('32,90', 60, 252, 18, weight: FontWeight.w700),
        cBox(32, 270, cardWidth, 1.5, color: AppColors.detailPillBorder),
        ..._field(32, 284, AppIcons.receipt, 'Jantar'),

        cText('Categorias', 32, 342, 14, weight: FontWeight.w700),
        cIcon(AppIcons.moreHorizontal, 286, 328, scale: 0.8333, color: AppColors.textPrimary, stroke: 2.8),
        ..._category(32, AppIcons.utensils, 'Alimentação', categoryWidth, selected: true),
        ..._category(32 + categoryWidth + 10, AppIcons.home, 'Moradia', categoryWidth),
        ..._category(32 + (categoryWidth + 10) * 2, AppIcons.car, 'Transporte', categoryWidth),
        cIcon(AppIcons.check, 32, 444, scale: 0.6667, stroke: 3),
        cSpans(
          [('Categoria selecionada: ', AppColors.textMuted), ('Alimentação', AppColors.textPrimary)],
          54,
          457,
          11,
          weight: FontWeight.w500,
        ),

        cText('Forma de pagamento', 32, 496, 13, weight: FontWeight.w600),
        for (final (i, (icon, label)) in _payments.indexed)
          ..._payment(32 + i * (paymentWidth + 8), icon, label, paymentWidth),

        ..._bottomNav(PhoneTab.add),
      ],
    );
  }

  List<Widget> _field(double x, double y, String icon, String value) => [
    cIcon(icon, x, y, scale: 0.75, stroke: 2.533),
    cText(value, x + 28, y + 14, 13, weight: FontWeight.w500),
  ];

  List<Widget> _category(double x, String icon, String label, double width, {bool selected = false}) {
    return [
      cBox(
        x,
        356,
        width,
        74,
        radius: 14,
        color: selected ? AppColors.avatar : AppColors.tileBackground,
        borderColor: selected ? AppColors.mint : AppColors.tileBorder,
        borderWidth: selected ? 1.4 : 1,
      ),
      cIcon(
        icon,
        x + width / 2 - 12,
        370,
        color: selected ? AppColors.textPrimary : AppColors.mint,
        stroke: 2,
      ),
      cText(label, x + width / 2, 418, 10, weight: FontWeight.w600, anchor: Anchor.middle),
    ];
  }

  List<Widget> _payment(double x, String icon, String label, double width) {
    return [
      cBox(
        x,
        510,
        width,
        64,
        radius: 12,
        color: AppColors.tileBackground,
        borderColor: AppColors.tileBorder,
      ),
      cIcon(icon, x + width / 2 - 11, 522, scale: 0.9167, stroke: 2.18),
      cText(label, x + width / 2, 562, 10, weight: FontWeight.w500, anchor: Anchor.middle),
    ];
  }
}

class PhoneCategoriesScreen extends StatelessWidget {
  const PhoneCategoriesScreen({super.key});

  static const _categories = [
    (AppIcons.utensils, 'Alimentação'),
    (AppIcons.shoppingBag, 'Compras'),
    (AppIcons.graduationCap, 'Educação'),
    (AppIcons.briefcase, 'Freela'),
    (AppIcons.gamepad, 'Lazer'),
    (AppIcons.home, 'Moradia'),
    (AppIcons.moreHorizontal, 'Outros'),
    (AppIcons.pawPrint, 'Pets'),
    (AppIcons.wallet, 'Salário'),
    (AppIcons.heart, 'Saúde'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _screenTitle('Categorias'),
        for (final (i, (icon, name)) in _categories.indexed)
          ..._card(16 + (i % 2) * 162, 102 + (i ~/ 2) * 110, icon, name),
        ..._bottomNav(PhoneTab.categories),
      ],
    );
  }

  List<Widget> _card(double x, double y, String icon, String name) {
    return [
      cBox(
        x,
        y,
        146,
        96,
        radius: 12,
        color: AppColors.tileBackground,
        borderColor: AppColors.detailPillBorder,
      ),
      cIcon(icon, x + 59, y + 22, scale: 1.1667, stroke: 1.8),
      cText(name, x + 73, y + 74, 12, weight: FontWeight.w700, anchor: Anchor.middle),
    ];
  }
}

class PhoneCategoryExtractScreen extends StatelessWidget {
  const PhoneCategoryExtractScreen({super.key});

  static const _previous = [
    ('Restaurante Sabor', r'R$ 41,90', '12/07/2026'),
    ('Café Colonial', r'R$ 18,90', '10/07/2026'),
    ('Pizzaria Bella', r'R$ 58,00', '09/07/2026'),
    ('Panificadora Central', r'R$ 12,50', '07/07/2026'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cIcon(AppIcons.arrowLeft, 16, 66, scale: 0.8333, color: AppColors.textPrimary, stroke: 2.4),
        _screenTitle('Alimentação'),

        cText(r'- R$ 400,50', 20, 146, 30, weight: FontWeight.w800, color: AppColors.red),
        cText(
          'ALIMENTAÇÃO',
          20,
          168,
          11,
          weight: FontWeight.w700,
          color: AppColors.mint,
          letterSpacing: 0.8,
        ),
        cCircle(294, 140, 28, color: AppColors.panelBackground, borderColor: AppColors.tileBorder),
        cIcon(AppIcons.utensils, 280, 126, scale: 1.1667, stroke: 1.8),

        cBox(
          16,
          192,
          308,
          170,
          radius: 22,
          color: AppColors.panelBackground,
          borderColor: AppColors.detailPillBorder,
        ),
        cCircle(54, 230, 22, color: AppColors.transactionIcon),
        cIcon(AppIcons.utensils, 43, 219, scale: 0.9167, stroke: 2.07),
        cText('Padaria Blumenau', 86, 226, 14, weight: FontWeight.w700),
        cText('Alimentação', 86, 244, 11, color: AppColors.textMuted),
        cText(r'- R$ 9,90', 308, 228, 13, weight: FontWeight.w700, color: AppColors.red, anchor: Anchor.end),
        cText('Lanche', 32, 292, 12.5),
        ..._info(32, 'Local', 'Padaria Blumenau'),
        ..._info(160, 'Data', '13/07/2026'),
        ..._info(256, 'Hora', '16:10'),

        cText('Transações anteriores', 16, 396, 14, weight: FontWeight.w700),
        for (final (i, (title, amount, date)) in _previous.indexed)
          ..._row(410 + i * 64.0, title, amount, date),
      ],
    );
  }

  List<Widget> _info(double x, String title, String value) => [
    cText(title, x, 324, 10.5, weight: FontWeight.w700),
    cText(value, x, 340, 10, color: AppColors.navLink),
  ];

  List<Widget> _row(double y, String title, String amount, String date) {
    return [
      cBox(
        16,
        y,
        308,
        56,
        radius: 12,
        color: AppColors.tileBackground,
        borderColor: AppColors.tileBorder,
      ),
      cBox(28, y + 13, 32, 30, radius: 9, color: AppColors.transactionIcon),
      cIcon(AppIcons.utensils, 35, y + 19, scale: 0.75, stroke: 2.533),
      cText(title, 72, y + 25, 12, weight: FontWeight.w600),
      cText('Alimentação', 72, y + 41, 10, color: AppColors.textMuted),
      cText(amount, 290, y + 25, 11.5, weight: FontWeight.w700, color: AppColors.red, anchor: Anchor.end),
      cText(date, 290, y + 41, 9.5, color: AppColors.textMuted, anchor: Anchor.end),
      cIcon(AppIcons.chevronRight, 296, y + 21, scale: 0.5, color: AppColors.textMuted, stroke: 3.6),
    ];
  }
}
