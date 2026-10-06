import 'package:flutter_test/flutter_test.dart';

import 'package:semsufoco/main.dart';

void main() {
  testWidgets('App starts on the landing page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Landing Page'), findsOneWidget);
  });
}
