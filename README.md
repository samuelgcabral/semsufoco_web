# SemSufoco — Landing Page

> **Controle hoje, conquiste amanhã.**
> The marketing landing page for SemSufoco, a personal finance app, built with Flutter Web.

![Flutter](https://img.shields.io/badge/Flutter-3.44-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.12-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/platform-web-3CF2A6)

A single-page, fully responsive landing page. The app screenshots are recreations of the real SemSufoco app screens, drawn with Flutter widgets rather than images, so they stay sharp at any size. All page copy is in Brazilian Portuguese.


<img width="1919" height="845" alt="Captura de tela 2026-10-08 203541" src="https://github.com/user-attachments/assets/b8ae544b-0a0d-4d8c-a5b6-b7478c34dd83" />

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Available Commands](#available-commands)
- [Project Structure](#project-structure)
- [Architecture Notes](#architecture-notes)
- [Testing](#testing)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Design-faithful layout:** the desktop layout follows the original 1440px design file, with the app mockups updated to match the real app.
- **Responsive:** three breakpoints, with mockups scaling down instead of overflowing.
  - Desktop (≥ 1100px)
  - Tablet (700–1099px)
  - Mobile (< 700px)
- **Widget-built mockups:** the app's real screens (Home, Novo lançamento, Categorias and the category statement) and cards from those screens.
- **Scroll animations:**
  - Visuals fade and zoom in as they enter the viewport.
  - Floating cards drift with a smoothed parallax effect.
  - Both respect the system's reduce-motion setting.
- **Sticky navigation:** nav links scroll smoothly to their sections.
- **FAQ accordion:** animated expand and collapse.
- **Hover states:** buttons and links react to the pointer.
- **Icons:** Lucide icon paths (plus a few custom ones, such as Pix) rendered with `flutter_svg`.

### Page sections

| # | Section | Widget |
|---|---------|--------|
| 1 | Navigation bar | `NavBar` |
| 2 | Hero | `HeroSection` |
| 3 | Monthly summary cards | `SummaryCardsSection` |
| 4 | Product showcase | `ShowcaseSection` |
| 5 | Before / after comparison | `BeforeAfterSection` |
| 6 | Feature blocks (×3) | `FeaturesSection` → `FeatureBlock` |
| 7 | How it works | `HowItWorksSection` |
| 8 | FAQ | `FaqSection` |
| 9 | Final call to action | `FinalCta` |
| 10 | Footer | `Footer` |

## Tech Stack

| Package | Purpose |
|---------|---------|
| [Flutter](https://flutter.dev) (Web) | UI framework |
| [google_fonts](https://pub.dev/packages/google_fonts) | Inter typeface |
| [flutter_svg](https://pub.dev/packages/flutter_svg) | Lucide icons and decorative SVG paths |
| [go_router](https://pub.dev/packages/go_router) | Routing |

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.44 or newer, which includes Dart 3.12
- Google Chrome, for running locally

Check your setup with:

```bash
flutter doctor
```

### Installation

```bash
git clone https://github.com/samuelgcabral/semsufoco_web.git
cd semsufoco_web
flutter pub get
```

### Running locally

```bash
flutter run -d chrome
```

## Available Commands

| Command | Description |
|---------|-------------|
| `flutter run -d chrome` | Start the app in Chrome with hot reload |
| `flutter analyze` | Run static analysis (lints from `flutter_lints`) |
| `flutter test` | Run the widget test suite |
| `flutter build web` | Build an optimized production bundle into `build/web` |
| `dart format lib test` | Format the source code |

## Project Structure

```
lib/
├── main.dart                     # App entry point and router
├── pages/
│   └── landing_page.dart         # Page composition, sticky nav, section scrolling
├── theme/
│   ├── app_colors.dart           # Color and gradient tokens
│   └── app_theme.dart            # ThemeData and Inter text styles
└── widgets/
    ├── nav_bar.dart
    ├── hero_section.dart
    ├── summary_cards.dart
    ├── showcase_section.dart
    ├── before_after_section.dart
    ├── feature_block.dart        # Reusable text + visual row
    ├── features_section.dart     # The three feature blocks and their visuals
    ├── how_it_works_section.dart
    ├── faq_section.dart
    ├── final_cta.dart
    ├── footer.dart
    ├── common/                   # Shared building blocks
    │   ├── app_icons.dart        # Lucide icon paths + AppIcon
    │   ├── app_logo.dart
    │   ├── buttons.dart
    │   ├── canvas.dart           # Helpers for placing widgets by design coordinates
    │   ├── cards.dart            # GlassCard, FloatingCard, glows
    │   ├── parallax.dart
    │   ├── reveal_on_scroll.dart
    │   ├── section_container.dart  # Responsive breakpoints and layout containers
    │   └── section_heading.dart
    └── mockups/
        ├── phone_mockup.dart     # Phone frame and the app screens
        └── finance_cards.dart    # Floating cards taken from app screens
test/
├── widget_test.dart              # Overflow tests across viewport widths
└── fonts/                        # Inter font files used only by tests
```

## Architecture Notes

- **Design tokens:** every color and gradient lives in `AppColors`, so widgets never hardcode colors.
- **Responsive layout:**
  - `SectionContainer.builder` passes each section its `ScreenSize` and available width. It uses `LayoutBuilder` instead of `MediaQuery`, so a section responds to the space it actually gets.
  - On desktop, the visual-heavy sections (hero, showcase, feature blocks and final call to action) are fixed 1200px compositions (`DesignFrame`). These scale down proportionally between 1100 and 1280px.
  - On tablet and mobile, sections stack vertically, and mockups shrink with `ScaledBox` (a `FittedBox`).
- **Design-coordinate helpers:** functions like `cText` and `cBox` in `canvas.dart` place elements using the design file's own coordinates. For text, the y coordinate is the baseline, matching SVG `<text>` elements.
- **Typography:** `AppText` builds Inter styles with an explicit line height, so text can be positioned precisely by its baseline.
- **App mockups:** the phone screens and floating cards recreate screens that exist in the SemSufoco app (Home, Novo lançamento, Categorias, the category statement and transaction details), using its example data. When the app changes, update `phone_mockup.dart` and `finance_cards.dart` so the page never shows features the app doesn't have.

## Testing

The test suite renders the full page at 360, 699, 700, 768, 1099, 1100, 1440 and 1920px wide. It scrolls through the whole page and fails on any overflow or layout error.

```bash
flutter test
```

The default test font draws every letter as a square, which is much wider than Inter. So the tests load the real Inter font from `test/fonts/`, and the overflow checks measure realistic text widths.

## Deployment

Build the static bundle:

```bash
flutter build web --release
```

Then serve the `build/web` folder from any static host, such as Firebase Hosting, GitHub Pages, Vercel or Netlify.

If the site is served from a subpath (for example, on GitHub Pages), set the base href:

```bash
flutter build web --release --base-href /semsufoco_web/
```

## Contributing

1. Fork the repository.
2. Create a branch: `git checkout -b feature/my-change`.
3. Make sure `flutter analyze` and `flutter test` both pass.
4. Commit your changes and open a pull request.

## License

This project does not have a license yet. Until one is added, all rights are reserved by the author.
