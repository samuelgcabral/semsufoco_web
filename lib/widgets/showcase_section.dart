import 'package:flutter/material.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/common/parallax.dart';
import 'package:semsufoco/widgets/common/reveal_on_scroll.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/common/section_heading.dart';
import 'package:semsufoco/widgets/mockups/phone_mockup.dart';

class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({super.key});

  static const _paragraph = [
    'Chega de pular entre planilha, caderno e extrato. Receitas, despesas e',
    'categorias ficam juntas, organizadas e fáceis de ver.',
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
                const Positioned(
                  left: 50,
                  top: 291,
                  child: RevealOnScroll(child: ShowcaseVisual()),
                ),
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
              ScaledBox(
                size: ShowcaseVisual.size,
                child: const RevealOnScroll(child: ShowcaseVisual()),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShowcaseVisual extends StatelessWidget {
  const ShowcaseVisual({super.key});

  static const size = Size(1100, 680);

  static const _phoneScale = 0.82;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: const Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 110,
            top: 70,
            child: FloatingCard(
              degrees: -5,
              child: ScaledPhone(scale: _phoneScale, screen: PhoneCategoriesScreen()),
            ),
          ),
          Positioned(
            left: 698,
            top: 70,
            child: FloatingCard(
              degrees: 5,
              child: ScaledPhone(scale: _phoneScale, screen: PhoneCategoryExtractScreen()),
            ),
          ),
          Positioned(
            left: 404,
            top: 30,
            child: ScaledPhone(scale: _phoneScale, screen: PhoneHomeScreen()),
          ),
          Positioned(
            left: 150,
            top: 0,
            child: Parallax(
              offset: 30,
              child: PillLabel.callout(text: 'Seu saldo sempre à vista'),
            ),
          ),
          Positioned(
            left: 690,
            top: 630,
            child: Parallax(
              offset: -30,
              child: PillLabel.callout(text: 'Extrato separado por categoria'),
            ),
          ),
        ],
      ),
    );
  }
}
