import 'package:flutter/material.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/common/section_heading.dart';
import 'package:semsufoco/widgets/mockups/desktop_mockup.dart';

class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({super.key});

  static const _paragraph = [
    'Chega de pular entre planilha, caderno e extrato. Receitas, despesas e metas',
    'ficam juntas, organizadas e fáceis de ver.',
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        if (size == ScreenSize.desktop) {
          return DesignFrame(
            height: 980,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                positionedGlow(600, 620, 700),
                const Positioned(
                  left: 0,
                  right: 0,
                  top: 37.27,
                  child: SectionHeader(
                    eyebrow: 'TUDO NUM LUGAR SÓ',
                    white: 'Seu dinheiro inteiro',
                    mint: 'numa tela só.',
                    paragraph: _paragraph,
                  ),
                ),
                const Positioned(left: 50, top: 291, child: ShowcaseVisual()),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                eyebrow: 'TUDO NUM LUGAR SÓ',
                white: 'Seu dinheiro inteiro',
                mint: 'numa tela só.',
                paragraph: _paragraph,
                size: size,
              ),
              const SizedBox(height: 32),
              ScaledBox(size: ShowcaseVisual.size, child: const ShowcaseVisual()),
            ],
          ),
        );
      },
    );
  }
}

class ShowcaseVisual extends StatelessWidget {
  const ShowcaseVisual({super.key});

  static const size = Size(1100, 642);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: const Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(left: 0, top: 19, child: DesktopMockup()),
          Positioned(left: 210, top: 0, child: PillLabel.callout(text: 'Seu saldo sempre à vista')),
          Positioned(
            left: 690,
            top: 604,
            child: PillLabel.callout(text: 'Atalhos para o que você mais faz'),
          ),
        ],
      ),
    );
  }
}
