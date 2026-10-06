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
              'Data, horário, estabelecimento, valor e descrição numa',
              'tela só. Depois é só tocar na categoria e escolher a',
              'forma de pagamento.',
            ],
            checks: [
              'Data e horário de cada lançamento',
              'Crédito, débito, Pix ou dinheiro',
              'Categorias como Alimentação, Moradia e Transporte',
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
              'Cada movimentação mostra valor, categoria, data, horário',
              'e estabelecimento. Abra uma categoria e veja o total e',
              'todas as transações dela.',
            ],
            checks: [
              'Receitas em verde, despesas em vermelho',
              'Extrato separado por categoria',
              'Detalhes completos de cada movimentação',
            ],
          ),
          visual: const CategoriesVisual(),
          visualSize: CategoriesVisual.size,
          height: 700,
          textTop: 117.27,
          visualOffset: const Offset(-90, 60),
          onStart: onStart,
        ),
        FeatureBlock(
          content: const FeatureContent(
            eyebrow: 'ACOMPANHAMENTO DO MÊS',
            titleWhite: 'O seu mês inteiro',
            titleMint: 'num gráfico.',
            paragraph: [
              'Receitas, despesas e saldo a cada cinco dias. Troque o',
              'mês para olhar para trás e veja quanto o saldo mudou',
              'em relação ao mês anterior.',
            ],
            checks: [
              'Gráfico de receitas, despesas e saldo',
              'Seletor para ver meses anteriores',
              'Esconda o saldo com um toque',
            ],
          ),
          visual: const MonthlyVisual(),
          visualSize: MonthlyVisual.size,
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
              child: PhoneMockup(screen: PhoneNewTransactionScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesVisual extends StatelessWidget {
  const CategoriesVisual({super.key});

  static const size = Size(700, 600);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          positionedGlow(370, 280, 440),
          const Positioned(left: 160, top: 30, child: TransactionDetailCard()),
          const Positioned(
            left: 10,
            top: 54,
            child: FloatingCard(
              degrees: -5,
              parallax: 40,
              child: TransactionFloatCard(
                icon: AppIcons.wallet,
                title: 'Salário',
                category: 'Salário',
                amount: r'+ R$ 2.350,00',
                income: true,
              ),
            ),
          ),
          const Positioned(
            left: 362,
            top: 520,
            child: FloatingCard(
              degrees: 5,
              parallax: -40,
              child: TransactionFloatCard(
                icon: AppIcons.car,
                title: 'Oficina Blumenau',
                category: 'Transporte',
                amount: r'- R$ 180,00',
                income: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MonthlyVisual extends StatelessWidget {
  const MonthlyVisual({super.key});

  static const size = Size(580, 600);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          positionedGlow(240, 300, 430),
          const Positioned(left: 20, top: 80, child: BalanceChartCard()),
          const Positioned(
            left: 350,
            top: 400,
            child: FloatingCard(
              degrees: 3,
              parallax: -40,
              child: MonthPickerCard(),
            ),
          ),
          const Positioned(
            left: 300,
            top: 0,
            child: FloatingCard(
              degrees: 4,
              parallax: 40,
              child: HiddenBalanceChip(),
            ),
          ),
        ],
      ),
    );
  }
}
