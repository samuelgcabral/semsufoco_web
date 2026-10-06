import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/buttons.dart';
import 'package:semsufoco/widgets/common/canvas.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/mockups/finance_cards.dart';

class FinalCta extends StatelessWidget {
  const FinalCta({super.key, this.onStart});

  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        if (size == ScreenSize.desktop) {
          return DesignFrame(
            height: 540,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  top: 80,
                  width: 1200,
                  height: 420,
                  child: _Panel(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        cText(
                          'Pronto pra respirar?',
                          600,
                          120,
                          54,
                          weight: FontWeight.w800,
                          letterSpacing: -1.5,
                          anchor: Anchor.middle,
                        ),
                        cText(
                          'Registre seu primeiro gasto em segundos e veja o mês ganhar forma.',
                          600,
                          176,
                          20,
                          color: AppColors.ctaSubtitle,
                          anchor: Anchor.middle,
                        ),
                        cAt(
                          483,
                          214,
                          GradientButton(
                            label: 'Começar agora',
                            onPressed: onStart,
                            height: 64,
                            horizontalPadding: 35.6,
                            fontSize: 18,
                            trailingArrow: true,
                          ),
                        ),
                        cText(
                          'Direto no navegador   ·   Sem instalar nada',
                          600,
                          324,
                          14,
                          weight: FontWeight.w500,
                          color: AppColors.ctaNote,
                          anchor: Anchor.middle,
                        ),
                        cAt(
                          50,
                          252,
                          const FloatingCard(
                            degrees: -4,
                            parallax: 30,
                            child: CategoryMiniCard(),
                          ),
                        ),
                        cAt(
                          830,
                          280,
                          const FloatingCard(
                            degrees: 3,
                            parallax: -30,
                            child: TransactionFloatCard(
                              icon: AppIcons.wallet,
                              title: 'Salário',
                              category: 'Salário',
                              amount: r'+ R$ 2.350,00',
                              income: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        final mobile = size == ScreenSize.mobile;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: _Panel(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mobile ? 24 : 48,
                vertical: 56,
              ),
              child: Column(
                children: [
                  Text(
                    'Pronto pra respirar?',
                    textAlign: TextAlign.center,
                    style: AppText.style(
                      mobile ? 34 : 46,
                      weight: FontWeight.w800,
                      letterSpacing: -1,
                      lineHeight: mobile ? 42 : 54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Registre seu primeiro gasto em segundos e veja o mês ganhar forma.',
                    textAlign: TextAlign.center,
                    style: AppText.style(
                      mobile ? 17 : 20,
                      color: AppColors.ctaSubtitle,
                      lineHeight: mobile ? 26 : 28,
                    ),
                  ),
                  const SizedBox(height: 28),
                  GradientButton(
                    label: 'Começar agora',
                    onPressed: onStart,
                    height: 64,
                    horizontalPadding: 35.6,
                    fontSize: 18,
                    trailingArrow: true,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Direto no navegador   ·   Sem instalar nada',
                    textAlign: TextAlign.center,
                    style: AppText.style(
                      14,
                      weight: FontWeight.w500,
                      color: AppColors.ctaNote,
                      lineHeight: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({required this.child});

  final Widget child;

  static const _radius = BorderRadius.all(Radius.circular(40));

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppColors.ctaPanel,
              borderRadius: _radius,
              border: Border.fromBorderSide(
                BorderSide(color: AppColors.ctaPanelBorder),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: _radius,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: -220,
                  top: -300,
                  child: const RadialGlow(
                    radius: 360,
                    gradient: AppColors.glow,
                  ),
                ),
                const Positioned(
                  right: 200,
                  top: 150,
                  child: _DecorPill(height: 130),
                ),
                const Positioned(
                  right: 120,
                  top: 70,
                  child: _DecorPill(height: 210),
                ),
              ],
            ),
          ),
        ),
        const Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(painter: _GradientBorderPainter()),
          ),
        ),
        child,
      ],
    );
  }
}

class _DecorPill extends StatelessWidget {
  const _DecorPill({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: height,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.ctaDecor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  const _GradientBorderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect.deflate(0.5),
      const Radius.circular(39.5),
    );
    canvas.drawRRect(
      rrect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..shader = AppColors.ctaPanelLine.createShader(rect),
    );
  }

  @override
  bool shouldRepaint(_GradientBorderPainter oldDelegate) => false;
}
