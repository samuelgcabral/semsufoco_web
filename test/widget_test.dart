import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:semsufoco/main.dart';

void main() {
  setUpAll(() async {
    GoogleFonts.config.allowRuntimeFetching = false;
    for (final variant in ['regular', '500', '600', '700', '800']) {
      final bytes = File('test/fonts/Inter_$variant.ttf').readAsBytesSync();
      await (FontLoader('Inter_$variant')
            ..addFont(Future.value(ByteData.sublistView(bytes))))
          .load();
    }
  });

  for (final width in [360.0, 699.0, 700.0, 768.0, 1099.0, 1100.0, 1440.0, 1920.0]) {
    testWidgets('Landing page lays out without overflow at ${width.toInt()}px', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(const MyApp());
      await tester.pump();

      expect(find.text('Pronto pra respirar?'), findsOneWidget);
      expect(find.text('Dúvidas? A gente responde.', findRichText: true), findsOneWidget);

      final scrollable = find.byType(Scrollable).first;
      for (var i = 0; i < 60; i++) {
        await tester.drag(scrollable, const Offset(0, -400));
        await tester.pump();
      }
      expect(tester.takeException(), isNull);
    });
  }
}
