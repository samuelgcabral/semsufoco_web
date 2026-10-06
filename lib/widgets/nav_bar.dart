import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/widgets/common/app_logo.dart';
import 'package:semsufoco/widgets/common/buttons.dart';
import 'package:semsufoco/widgets/common/section_container.dart';

/// Sticky 88px top bar with a full-width 1px divider.
class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onFeatures,
    required this.onHowItWorks,
    required this.onFaq,
    required this.onLogin,
    required this.onStart,
  });

  static const double height = 89;

  final VoidCallback onFeatures;
  final VoidCallback onHowItWorks;
  final VoidCallback onFaq;
  final VoidCallback onLogin;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 88,
            child: SectionContainer.builder(
              builder: (context, size, width) {
                // Mobile collapses to logo + "Começar"; tablet adds "Entrar".
                final showLinks = size == ScreenSize.desktop;
                final showLogin = size != ScreenSize.mobile;
                return Row(
                  children: [
                    const AppLogo(),
                    const Spacer(),
                    if (showLinks) ...[
                      _link('Recursos', onFeatures),
                      const SizedBox(width: 34),
                      _link('Como funciona', onHowItWorks),
                      const SizedBox(width: 34),
                      _link('Perguntas', onFaq),
                      const SizedBox(width: 94),
                    ],
                    if (showLogin) ...[
                      _link(
                        'Entrar',
                        onLogin,
                        weight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: showLinks ? 36 : 24),
                    ],
                    GradientButton(
                      label: 'Começar',
                      onPressed: onStart,
                      height: 44,
                      horizontalPadding: 33.9,
                      fontSize: 14,
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 1,
            width: double.infinity,
            child: ColoredBox(color: AppColors.divider),
          ),
        ],
      ),
    );
  }

  // In the design the link baselines sit 4.5px below the button's center line.
  Widget _link(
    String label,
    VoidCallback onPressed, {
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.navLink,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: NavTextLink(label: label, onPressed: onPressed, weight: weight, color: color),
    );
  }
}
