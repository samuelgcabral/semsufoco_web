import 'package:flutter/painting.dart';

abstract final class AppColors {
  static const background = Color(0xFF060B0A);
  static const mint = Color(0xFF3CF2A6);
  static const mintGradientStart = Color(0xFF2FE6AE);
  static const mintGradientEnd = Color(0xFF12B886);
  static const textPrimary = Color(0xFFF2F7F5);
  static const textSecondary = Color(0xFFA9BDB7);
  static const textMuted = Color(0xFF8FA39D);
  static const textSubtle = Color(0xFF5E736D);
  static const navLink = Color(0xFFC9D8D3);
  static const onMint = Color(0xFF04140F);
  static const cardBackground = Color(0xFF09130F);
  static const cardBorder = Color(0xFF16392F);
  static const divider = Color(0xFF10241F);
  static const red = Color(0xFFF86166);
  static const iconCircle = Color(0xFF0F4A3B);

  static const eyebrowBackground = Color(0xFF0C1F1B);
  static const eyebrowBorder = Color(0xFF174A3D);
  static const eyebrowText = Color(0xFF9FE9CE);
  static const secondaryButtonBackground = Color(0xFF0A1613);
  static const secondaryButtonBorder = Color(0xFF1F4A3E);

  static const heroRingInner = Color(0xFF14463A);
  static const heroRingOuter = Color(0xFF10372E);
  static const heroDot = Color(0xCC3CF2A6);

  static const floatingCardBackground = Color(0xFF0A1B17);
  static const floatingCardBorder = Color(0xFF1F5A4A);
  static const chipBackground = Color(0xFF0B2A22);
  static const chipBorder = Color(0xFF2A8F70);
  static const chipIconBackground = Color(0xFF14523F);
  static const progressTrack = Color(0xFF12302A);
  static const detailCardBackground = Color(0xFF071311);
  static const detailPillBorder = Color(0xFF1E6B55);
  static const ringTrack = Color(0xFF0F2A24);
  static const redSummaryIcon = Color(0xFF4A1A1E);

  static const deviceFrame = Color(0xFF0A100E);
  static const deviceFrameBorder = Color(0xFF2E5247);
  static const deviceIsland = Color(0xFF000000);
  static const homeIndicator = Color(0x8CF2F7F5);
  static const batteryOutline = Color(0x99F2F7F5);
  static const balanceCardBorder = Color(0xFF1A6A52);
  static const balanceLabel = Color(0xFFCFE9E0);
  static const balanceCaption = Color(0xFF9FC9BC);
  static const avatar = Color(0xFF0E7A55);
  static const tileBackground = Color(0xFF0B1B18);
  static const tileBorder = Color(0xFF14382F);
  static const tileIconActive = Color(0xFF2EE0A6);
  static const listBackground = Color(0xFF0A1614);
  static const transactionIcon = Color(0xFF0E3A2F);
  static const rowDivider = Color(0xFF12332A);
  static const bottomNavBackground = Color(0xFF07110E);
  static const panelBackground = Color(0xFF0B1715);

  static const monthSelector = Color(0xFF06120F);
  static const monthSelectorBorder = Color(0xFF2A6A58);
  static const chartGrid = Color(0x592A7A66);

  static const categoryFood = Color(0xFFFFA726);
  static const categoryHousing = Color(0xFF42A5F5);
  static const categoryTransport = Color(0xFFFFCA28);

  static const redCardBorder = Color(0xFF4A2024);
  static const redIconBackground = Color(0xFF3A171A);
  static const redText = Color(0xFFC7AEB0);
  static const redDivider = Color(0xFF3A1B1E);
  static const greenCardBorder = Color(0xFF1F7A60);
  static const greenDivider = Color(0xFF1B5A48);

  static const faqOpenBorder = Color(0xFF1F7A60);

  static const ctaPanelBorder = Color(0xFF2FBE92);
  static const ctaSubtitle = Color(0xFFC5E8DC);
  static const ctaNote = Color(0xFF9FD9C6);
  static const ctaDecor = Color(0x123CF2A6);
  static const stepNumber = Color(0x1F3CF2A6);

  static const mintGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [mintGradientStart, mintGradientEnd],
  );
  static const mintVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF46F5AE), Color(0xFF12B27F)],
  );
  static const bar = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF4BF7B1), Color(0xFF12A06E)],
  );
  static const balanceCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0F7A55), Color(0xFF083D31), Color(0xFF05211C)],
    stops: [0, 0.55, 1],
  );
  static const tile = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1FD7A0), Color(0xFF0B8F63)],
  );
  static const ctaPanel = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0C7A55), Color(0xFF08382D), Color(0xFF05201A)],
    stops: [0, 0.5, 1],
  );
  static const ctaPanelLine = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x8C3CF2A6), Color(0x0D3CF2A6)],
  );
  static const redCard = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF2A1214), Color(0xFF120A0B)],
  );
  static const greenCard = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0C3A2E), Color(0xFF07201A)],
  );
  static const glow = RadialGradient(
    colors: [Color(0x423CF2A6), Color(0x141ED9A6), Color(0x001ED9A6)],
    stops: [0, 0.55, 1],
  );
  static const glowSoft = RadialGradient(
    colors: [Color(0x293CF2A6), Color(0x003CF2A6)],
  );
}
