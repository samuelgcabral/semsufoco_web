import 'package:flutter/material.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/cards.dart';
import 'package:semsufoco/widgets/feature_block.dart';
import 'package:semsufoco/widgets/mockups/finance_cards.dart';
import 'package:semsufoco/widgets/mockups/phone_mockup.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key, this.onStart});

  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeatureBlock(
          content: const FeatureContent(
            eyebrow: 'REGISTRO RÁPIDO',
            titleWhite: 'Registrar um gasto',
            titleMint: 'leva segundos.',
            paragraph: [
              'Escolha a data, dê um nome, informe o valor e toque na',
              'categoria. Pronto: o gasto entra no seu mês e o saldo',
              'se atualiza sozinho.',
            ],
            checks: [
              'Data do lançamento sempre à mão',
              'Valor em reais, do jeito que você digita',
              'Saúde, Moradia, Transporte e Alimentação',
            ],
          ),
          visual: const QuickEntryVisual(),
          visualSize: QuickEntryVisual.size,
          height: 840,
          textTop: 177.27,
          visualOffset: const Offset(700, 50),
          onStart: onStart,
        ),
        FeatureBlock(
          reversed: true,
          content: const FeatureContent(
            eyebrow: 'CATEGORIAS E DETALHES',
            titleWhite: 'Saiba pra onde',
            titleMint: 'seu dinheiro foi.',
            paragraph: [
              'Cada movimentação mostra valor, categoria, data e horário.',
              'Receitas em verde, despesas em vermelho, e nada se perde',
              'no meio do caminho.',
            ],
            checks: [
              'Receitas e despesas com cores distintas',
              'Categoria editável em um toque',
              'Histórico em Movimentações recentes',
            ],
          ),
          visual: const CategoriesVisual(),
          visualSize: CategoriesVisual.size,
          height: 700,
          textTop: 117.27,
          visualOffset: const Offset(-90, 90),
          onStart: onStart,
        ),
        FeatureBlock(
          content: const FeatureContent(
            eyebrow: 'METAS E PLANEJAMENTO',
            titleWhite: 'Metas que saem',
            titleMint: 'do papel.',
            paragraph: [
              'Defina a meta do mês e acompanhe o progresso. O saldo',
              'futuro mostra para onde o seu dinheiro vai antes de o',
              'mês acabar.',
            ],
            checks: [
              'Barra de progresso da meta do mês',
              'Saldo futuro sempre à vista',
              'Relatórios para entender o seu mês',
            ],
          ),
          visual: const GoalsVisual(),
          visualSize: GoalsVisual.size,
          height: 760,
          textTop: 187.27,
          visualOffset: const Offset(640, 130),
          onStart: onStart,
        ),
      ],
    );
  }
}

class QuickEntryVisual extends StatelessWidget {
  const QuickEntryVisual({super.key});

  static const size = Size(460, 760);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          positionedGlow(220, 380, 430),
          const Positioned(
            left: 42,
            top: 10,
            child: FloatingCard(
              degrees: 3,
              child: PhoneMockup(screen: PhoneAddExpenseScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesVisual extends StatelessWidget {
  const CategoriesVisual({super.key});

  static const size = Size(700, 580);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          positionedGlow(370, 260, 440),
          const Positioned(left: 160, top: 30, child: TransactionDetailCard()),
          const Positioned(
            left: 10,
            top: 54,
            child: FloatingCard(
              degrees: -5,
              parallax: 40,
              child: TransactionFloatCard(
                icon: AppIcons.briefcase,
                title: 'Salário',
                category: 'Renda',
                amount: r'+ R$ 2.500,00',
                income: true,
              ),
            ),
          ),
          const Positioned(
            left: 362,
            top: 488,
            child: FloatingCard(
              degrees: 5,
              parallax: -40,
              child: TransactionFloatCard(
                icon: AppIcons.car,
                title: 'Posto de combustível',
                category: 'Transporte',
                amount: r'- R$ 200,00',
                income: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoalsVisual extends StatelessWidget {
  const GoalsVisual({super.key});

  static const size = Size(580, 600);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          positionedGlow(240, 300, 430),
          const Positioned(left: 20, top: 90, child: GoalRingCard()),
          const Positioned(
            left: 260,
            top: 420,
            child: FloatingCard(
              degrees: 3,
              parallax: -40,
              child: FutureBalanceCard(),
            ),
          ),
          const Positioned(
            left: 316,
            top: 20,
            child: FloatingCard(
              degrees: 4,
              parallax: 40,
              child: MonthlyReportCard(),
            ),
          ),
        ],
      ),
    );
  }
}
