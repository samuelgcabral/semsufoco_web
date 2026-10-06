import 'package:flutter/material.dart';
import 'package:semsufoco/widgets/before_after_section.dart';
import 'package:semsufoco/widgets/faq_section.dart';
import 'package:semsufoco/widgets/features_section.dart';
import 'package:semsufoco/widgets/final_cta.dart';
import 'package:semsufoco/widgets/footer.dart';
import 'package:semsufoco/widgets/hero_section.dart';
import 'package:semsufoco/widgets/how_it_works_section.dart';
import 'package:semsufoco/widgets/nav_bar.dart';
import 'package:semsufoco/widgets/showcase_section.dart';
import 'package:semsufoco/widgets/summary_cards.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _featuresKey = GlobalKey();
  final _howItWorksKey = GlobalKey();
  final _faqKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  void _start() {}

  void _login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onFeatures: () => _scrollTo(_featuresKey),
            onHowItWorks: () => _scrollTo(_howItWorksKey),
            onFaq: () => _scrollTo(_faqKey),
            onLogin: _login,
            onStart: _start,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(
                    onStart: _start,
                    onHowItWorks: () => _scrollTo(_howItWorksKey),
                  ),
                  const SummaryCardsSection(),
                  ShowcaseSection(key: _featuresKey),
                  const BeforeAfterSection(),
                  FeaturesSection(onStart: _start),
                  HowItWorksSection(key: _howItWorksKey),
                  FaqSection(key: _faqKey),
                  FinalCta(onStart: _start),
                  Footer(
                    onFeatures: () => _scrollTo(_featuresKey),
                    onHowItWorks: () => _scrollTo(_howItWorksKey),
                    onFaq: () => _scrollTo(_faqKey),
                    onLogin: _login,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
