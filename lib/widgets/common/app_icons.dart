import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:semsufoco/theme/app_colors.dart';

abstract final class AppIcons {
  static const arrowRight = '<path d="M5 12h14M13 5l7 7-7 7"/>';
  static const arrowUpRight = '<path d="M7 17L17 7M8 7h9v9"/>';
  static const arrowDown = '<path d="M12 5v14M19 12l-7 7-7-7"/>';
  static const monitor =
      '<rect x="2" y="3" width="20" height="14" rx="2"/><path d="M8 21h8M12 17v4"/>';
  static const smartphone =
      '<rect x="5" y="2" width="14" height="20" rx="3"/><path d="M11 18h2"/>';
  static const zap = '<path d="M13 2L3 14h9l-1 8 10-12h-9z"/>';
  static const bell =
      '<path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9M10.3 21a2 2 0 0 0 3.4 0"/>';
  static const eye =
      '<path d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12z"/><circle cx="12" cy="12" r="3"/>';
  static const plus = '<path d="M12 5v14M5 12h14"/>';
  static const minus = '<path d="M5 12h14"/>';
  static const target =
      '<circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/>';
  static const fileText =
      '<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><path d="M14 2v6h6M16 13H8M16 17H8M10 9H8"/>';
  static const shoppingCart =
      '<circle cx="8" cy="21" r="1"/><circle cx="19" cy="21" r="1"/><path d="M2 2h2.5l2.7 12.4a2 2 0 0 0 2 1.6h9.6a2 2 0 0 0 2-1.6L22 7H5.2"/>';
  static const briefcase =
      '<rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2M2 13h20"/>';
  static const car =
      '<path d="M5 11l1.5-4.5A2 2 0 0 1 8.4 5h7.2a2 2 0 0 1 1.9 1.5L19 11"/><rect x="3" y="11" width="18" height="6" rx="2"/><path d="M7 17v2.5M17 17v2.5"/><circle cx="7.5" cy="14" r=".7"/><circle cx="16.5" cy="14" r=".7"/>';
  static const gamepad =
      '<rect x="2" y="6" width="20" height="12" rx="6"/><path d="M7 10v4M5 12h4"/><circle cx="15.5" cy="11" r=".9"/><circle cx="18" cy="13.5" r=".9"/>';
  static const home =
      '<path d="M3 10.5L12 3l9 7.5V20a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><path d="M9 22v-9h6v9"/>';
  static const repeat =
      '<path d="M17 3l4 4-4 4M3 11V9a4 4 0 0 1 4-4h14M7 21l-4-4 4-4M21 13v2a4 4 0 0 1-4 4H3"/>';
  static const barChart = '<path d="M12 20V10M18 20V4M6 20v-4"/>';
  static const sliders =
      '<path d="M4 21v-7M4 10V3M12 21v-9M12 8V3M20 21v-5M20 12V3M1 14h6M9 8h6M17 16h6"/>';
  static const check = '<path d="M20 6L9 17l-5-5"/>';
  static const x = '<path d="M18 6L6 18M6 6l12 12"/>';
  static const trendingUp =
      '<path d="M22 7l-8.5 8.5-5-5L2 17"/><path d="M16 7h6v6"/>';
  static const wallet =
      '<path d="M19 7V4a1 1 0 0 0-1-1H5a2 2 0 0 0 0 4h15a1 1 0 0 1 1 1v4h-3a2 2 0 0 0 0 4h3a1 1 0 0 0 1-1v-2"/><path d="M3 5v14a2 2 0 0 0 2 2h15a1 1 0 0 0 1-1v-4"/>';
  static const calendar =
      '<rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18"/>';
  static const chevronDown = '<path d="M6 9l6 6 6-6"/>';
  static const chevronLeft = '<path d="M15 18l-6-6 6-6"/>';
  static const chevronRight = '<path d="M9 18l6-6-6-6"/>';
  static const heart =
      '<path d="M19 14c1.5-1.5 3-3.2 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.8 0-3 .5-4.5 2-1.5-1.5-2.7-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4 3 5.5l7 7z"/>';
  static const utensils =
      '<path d="M3 2v7c0 1.1.9 2 2 2h4a2 2 0 0 0 2-2V2M7 2v20M21 15V2a5 5 0 0 0-5 5v6c0 1.1.9 2 2 2h3zm0 0v7"/>';
  static const pencil =
      '<path d="M17 3a2.8 2.8 0 0 1 4 4L7.5 20.5 2 22l1.5-5.5z"/>';
  static const clock = '<circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/>';
  static const layers =
      '<path d="M12 2L2 7l10 5 10-5z"/><path d="M2 17l10 5 10-5M2 12l10 5 10-5"/>';
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color = AppColors.mint,
    this.strokeWidth = 2,
  });

  final String icon;
  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final argb = color.toARGB32();
    final hex = (argb & 0xFFFFFF).toRadixString(16).padLeft(6, '0');
    final opacity = ((argb >> 24) & 0xFF) / 255;
    final svg =
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" '
        'stroke="#$hex" stroke-opacity="$opacity" stroke-width="$strokeWidth" '
        'stroke-linecap="round" stroke-linejoin="round">$icon</svg>';
    return SvgPicture.string(svg, width: size, height: size);
  }
}
