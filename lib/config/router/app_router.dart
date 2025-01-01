import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitnest/presentation/screens/home/home_view.dart';
import 'package:fitnest/presentation/screens/settings/settings_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsView(),
      ),
    ],
  );

  static void pushNamed(BuildContext context, String name) {
    context.pushNamed(name);
  }

  static void pop(BuildContext context) {
    context.pop();
  }

  static void pushReplacementNamed(BuildContext context, String name) {
    context.pushReplacementNamed(name);
  }

  static bool canPop(BuildContext context) {
    return context.canPop();
  }
} 