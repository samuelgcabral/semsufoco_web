import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:semsufoco/pages/landing_page.dart';
import 'package:semsufoco/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingPage()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SemSufoco',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      routerConfig: _router,
    );
  }
}
