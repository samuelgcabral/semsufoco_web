import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/buttons.dart';
import 'package:semsufoco/widgets/common/canvas.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/common/section_heading.dart';
import 'package:semsufoco/widgets/mockups/finance_cards.dart';
import 'package:semsufoco/widgets/mockups/phone_mockup.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onStart, required this.onHowItWorks});

  final VoidCallback onStart;
  final VoidCallback onHowItWorks;

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        if (size == ScreenSize.desktop) {
          return DesignFrame(
            height: 830,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                positionedGlow(1018, 411, 620, gradient: AppColors.glow),
                _ring(1018, 401, 300, AppColors.heroRingInner),
                _ring(1018, 401, 420, AppColors.heroRingOuter),
                for (final (x, y, r) in _dots) cCircle(x, y, r, color: AppColors.heroDot),
                Positioned(
                  left: 0,
                  top: 61,
                  width: 640,
                  child: _HeroCopy(size: size, onStart: onStart, onHowItWorks: onHowItWorks),
                ),
                const Positioned(left: 530, top: 21, child: HeroVisual()),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 48, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroCopy(size: size, onStart: onStart, onHowItWorks: onHowItWorks),
              const SizedBox(height: 40),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: OverflowBox(
                      maxWidth: width * 1.6,
                      maxHeight: width * 1.6,
                      child: RadialGlow(radius: width * 0.8, gradient: AppColors.glow),
                    ),
                  ),
                  ScaledBox(size: HeroVisual.size, child: const HeroVisual()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static const _dots = [
    (820.0, 31.0, 4.0),
    (1265.0, 241.0, 5.0),
    (1170.0, 801.0, 4.0),
    (520.0, 751.0, 3.0),
    (1280.0, 551.0, 3.0),
  ];

  static Widget _ring(double cx, double cy, double r, Color color) {
    return Positioned(
      left: cx - r,
      top: cy - r,
      width: r * 2,
      height: r * 2,
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
        ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.size, required this.onStart, required this.onHowItWorks});

  final ScreenSize size;
  final VoidCallback onStart;
  final VoidCallback onHowItWorks;

  @override
  Widget build(BuildContext context) {
    final wide = size == ScreenSize.desktop;
    final headlineSize = switch (size) {
      ScreenSize.desktop => 62.0,
      ScreenSize.tablet => 52.0,
      ScreenSize.mobile => 40.0,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PillLabel(text: 'Controle hoje, conquiste amanhã.'),
        SizedBox(height: wide ? 23.4 : 20),
        Text.rich(
          TextSpan(
            style: AppText.style(
              headlineSize,
              weight: FontWeight.w800,
              letterSpacing: wide ? -1.5 : -1,
              lineHeight: headlineSize * 1.16,
            ),
            children: const [
              TextSpan(text: 'Sua grana em ordem,\n'),
              TextSpan(text: 'sem sufoco', style: TextStyle(color: AppColors.mint)),
              TextSpan(text: '\nno fim do mês.'),
            ],
          ),
        ),
        SizedBox(height: wide ? 29.3 : 20),
        Text(
          joinLines(const [
            'Registre gastos em segundos, acompanhe seu saldo e conquiste',
            'suas metas. Tudo num só lugar, direto no navegador.',
          ], wide: wide),
          style: AppText.style(
            wide ? 20 : 17,
            color: AppColors.textSecondary,
            lineHeight: wide ? 32 : 27,
          ),
        ),
        SizedBox(height: wide ? 39.3 : 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            GradientButton(label: 'Começar agora', onPressed: onStart, trailingArrow: true),
            SecondaryButton(label: 'Ver como funciona', onPressed: onHowItWorks),
          ],
        ),
        SizedBox(height: wide ? 47 : 32),
        const Wrap(
          spacing: 44,
          runSpacing: 14,
          children: [
            _TrustItem(AppIcons.monitor, 'Direto no navegador'),
            _TrustItem(AppIcons.smartphone, 'Celular ou computador'),
            _TrustItem(AppIcons.zap, 'Sem instalar nada'),
          ],
        ),
      ],
    );
  }
}

class _TrustItem extends StatelessWidget {
  const _TrustItem(this.icon, this.label);

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(icon, size: 20, strokeWidth: 2.28),
        const SizedBox(width: 10),
        Text(
          label,
          style: AppText.style(
            14.5,
            weight: FontWeight.w500,
            color: AppColors.textMuted,
            lineHeight: 20,
          ),
        ),
      ],
    );
  }
}

class HeroVisual extends StatelessWidget {
  const HeroVisual({super.key});

  static const size = Size(690, 780);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: const Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 310,
            top: 18,
            child: FloatingCard(degrees: -3, child: PhoneMockup(screen: PhoneHomeScreen())),
          ),
          Positioned(left: 66, top: 430, child: FloatingCard(degrees: -4, child: GoalMiniCard())),
          Positioned(left: 12, top: 608, child: FloatingCard(degrees: 4, child: ExpenseToastCard())),
          Positioned(left: 130, top: 40, child: FloatingCard(degrees: -5, child: TrendChip())),
        ],
      ),
    );
  }
}
