import 'package:flutter/material.dart';
import 'package:semsufoco/theme/app_colors.dart';
import 'package:semsufoco/theme/app_theme.dart';
import 'package:semsufoco/widgets/common/app_icons.dart';
import 'package:semsufoco/widgets/common/section_container.dart';
import 'package:semsufoco/widgets/common/section_heading.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  static const _items = [
    (
      'Preciso instalar alguma coisa?',
      'Não. O SemSufoco roda direto no navegador, no celular ou no computador.\n'
          'Basta abrir o endereço e começar a registrar.',
    ),
    (
      'Como registro um gasto?',
      'Toque em "Adicionar" na barra de baixo. Informe data, horário, '
          'estabelecimento e valor, adicione uma descrição se quiser e escolha a '
          'categoria e a forma de pagamento.',
    ),
    (
      'Posso separar os gastos por categoria?',
      'Sim. Cada gasto fica em uma categoria, como Alimentação, Moradia, '
          'Transporte, Saúde ou Lazer. Abrindo uma categoria, você vê o total e '
          'todas as transações dela.',
    ),
    (
      'Consigo comparar com o mês anterior?',
      'Sim. A tela inicial mostra o saldo atual e quanto ele mudou em relação '
          'ao mês anterior. No gráfico, você escolhe o mês que quer ver.',
    ),
    (
      'Funciona bem no celular?',
      'Sim. O SemSufoco foi feito pensando no celular e roda direto no '
          'navegador, sem instalar nada.',
    ),
  ];

  int? _open = 0;

  @override
  Widget build(BuildContext context) {
    return SectionContainer.builder(
      builder: (context, size, width) {
        final desktop = size == ScreenSize.desktop;
        return Padding(
          padding: EdgeInsets.only(top: desktop ? 67.27 : 64, bottom: desktop ? 62 : 64),
          child: Column(
            children: [
              SectionHeader(
                eyebrow: 'PERGUNTAS FREQUENTES',
                white: 'Dúvidas? A gente responde.',
                size: size,
              ),
              SizedBox(height: desktop ? 48.73 : 32),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  children: [
                    for (final (i, (question, answer)) in _items.indexed) ...[
                      if (i > 0) const SizedBox(height: 14),
                      FaqItem(
                        question: question,
                        answer: answer,
                        open: _open == i,
                        onTap: () => setState(() => _open = _open == i ? null : i),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FaqItem extends StatelessWidget {
  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
    required this.open,
    required this.onTap,
  });

  final String question;
  final String answer;
  final bool open;
  final VoidCallback onTap;

  static const _duration = Duration(milliseconds: 220);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      decoration: BoxDecoration(
        color: open ? AppColors.floatingCardBackground : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: open ? AppColors.faqOpenBorder : AppColors.cardBorder,
          width: open ? 1.2 : 1,
        ),
      ),
      child: AnimatedSize(
        duration: _duration,
        curve: Curves.easeOutCubic,
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onTap,
                behavior: HitTestBehavior.opaque,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 72),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 12, 28, 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            question,
                            style: AppText.style(18, weight: FontWeight.w700, lineHeight: 24),
                          ),
                        ),
                        const SizedBox(width: 16),
                        AnimatedContainer(
                          duration: _duration,
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: open ? AppColors.iconCircle : AppColors.eyebrowBackground,
                          ),
                          alignment: Alignment.center,
                          child: AppIcon(
                            open ? AppIcons.minus : AppIcons.plus,
                            size: 18,
                            strokeWidth: 3.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (open)
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 22.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 1, child: ColoredBox(color: AppColors.rowDivider)),
                    const SizedBox(height: 16.2),
                    Text(
                      answer,
                      style: AppText.style(16, color: AppColors.textSecondary, lineHeight: 26),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
