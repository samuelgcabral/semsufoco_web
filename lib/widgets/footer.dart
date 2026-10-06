import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_logo.dart';
import 'package:semsufoco/widgets/common/buttons.dart';
import 'package:semsufoco/widgets/common/section_container.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.onFeatures,
    required this.onHowItWorks,
    required this.onFaq,
    required this.onLogin,
  });

  final VoidCallback onFeatures;
  final VoidCallback onHowItWorks;
  final VoidCallback onFaq;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final links = [
      NavTextLink(label: 'Recursos', onPressed: onFeatures, fontSize: 14),
      NavTextLink(label: 'Como funciona', onPressed: onHowItWorks, fontSize: 14),
      NavTextLink(label: 'Perguntas', onPressed: onFaq, fontSize: 14),
      NavTextLink(label: 'Entrar', onPressed: onLogin, fontSize: 14),
    ];
    final tagline = Text(
      'Controle hoje, conquiste amanhã.',
      style: AppText.style(14, color: AppColors.textMuted, lineHeight: 20),
    );
    final copyright = Text(
      '© 2026 SemSufoco. Feito com Flutter.',
      style: AppText.style(13, color: AppColors.textSubtle, lineHeight: 18),
    );
    final platforms = Text(
      'Direto no navegador, no celular ou no computador.',
      style: AppText.style(13, color: AppColors.textSubtle, lineHeight: 18),
    );
    const divider = SizedBox(
      height: 1,
      width: double.infinity,
      child: ColoredBox(color: AppColors.divider),
    );

    return Column(
      children: [
        divider,
        SectionContainer.builder(
          builder: (context, size, width) {
            if (size == ScreenSize.desktop) {
              return SizedBox(
                height: 209,
                child: Stack(
                  children: [
                    const Positioned(left: 0, top: 33, child: AppLogo()),
                    Positioned(
                      right: 0,
                      top: 41.9,
                      child: Row(
                        children: [
                          for (final (i, link) in links.indexed) ...[
                            if (i > 0) const SizedBox(width: 36),
                            link,
                          ],
                        ],
                      ),
                    ),
                    Positioned(left: 0, top: 79.9, child: tagline),
                    const Positioned(left: 0, right: 0, top: 129, child: divider),
                    Positioned(left: 0, top: 149.27, child: copyright),
                    Positioned(right: 0, top: 149.27, child: platforms),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppLogo(),
                  const SizedBox(height: 12),
                  tagline,
                  const SizedBox(height: 24),
                  Wrap(spacing: 28, runSpacing: 12, children: links),
                  const SizedBox(height: 24),
                  divider,
                  const SizedBox(height: 16),
                  copyright,
                  const SizedBox(height: 6),
                  platforms,
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
